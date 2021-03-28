import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

import 'guest_profile.dart';

class AddRecipe extends StatefulWidget {
  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  File _image;
  String _uploadedFileURL;
  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  Future uploadFile() async {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('recipe/${Path.basename(_image.path)}}');
    firebase_storage.UploadTask uploadTask = ref.putFile(_image);
    await uploadTask;
    ref.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
        print(_uploadedFileURL);
      });
    });
  }

  getLoginStatus() {
    if (FirebaseAuth.instance.currentUser != null) {
      return false;
    } else {
      return true;
    }
  }

  TextEditingController recipeNameController = TextEditingController();
  TextEditingController ingredintsController = TextEditingController();
  TextEditingController preparationDescController = TextEditingController();
  TextEditingController preparationTimeController = TextEditingController();
  String myRecipeName, myIngredients, myPreparationDesc, myPreparationTime;
  String myCuisineType = "North Indian";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Recipe"),
      ),
      body: getLoginStatus()
          ? GuestProfile()
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Enter The Recipe Details",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                      controller: recipeNameController,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          hintText: 'Add Recipe Name',
                          hintStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Cuisne type",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          DropdownButton(
                              value: myCuisineType,
                              style: const TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold),
                              underline: Container(
                                height: 1,
                                color: Colors.black,
                              ),
                              icon: const Icon(Icons.arrow_drop_down),
                              onChanged: (String newValue) {
                                setState(() {
                                  myCuisineType = newValue;
                                });
                              },
                              items: [
                                'North Indian',
                                'South Indian',
                                'Chinese',
                                'Italian',
                                'Other'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList()),
                        ],
                      ),
                    ),
                    TextField(
                      controller: ingredintsController,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          hintText: "Ingredients",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    TextField(
                      controller: preparationDescController,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          hintText: "Preparation Description",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    TextField(
                      controller: preparationTimeController,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          hintText: 'Preparation Time',
                          hintStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    ElevatedButton(
                        onPressed: chooseFile,
                        child: Text("Select the recipe image")),
                    (_image != null)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.file(
                                _image,
                                height: 130,
                                width: 150,
                              ),
                              IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    setState(() {
                                      _image = null;
                                    });
                                  })
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: 35,
                    ),
                    InkWell(
                      splashColor: Colors.greenAccent,
                      onTap: () {
                        uploadFile();
                        myRecipeName = recipeNameController.text;
                        myIngredients = ingredintsController.text;
                        myPreparationDesc = preparationDescController.text;
                        myPreparationTime = preparationTimeController.text;
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.green,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
