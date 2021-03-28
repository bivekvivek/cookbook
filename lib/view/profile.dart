import 'package:cookbook/view/guest_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/widgets/profile_menu_item.dart';
import 'package:cookbook/helperFunctions/sharedpref_helper.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String myEmail = "xyz@gmail.com";
  String myName = "John Doe";
  String myProfilePic =
      "https://image.flaticon.com/icons/png/128/1077/1077114.png";

  getUserInfo() async {
    myName = await SharedPreferenceHelper().getDisplayName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    myProfilePic = await SharedPreferenceHelper().getUserProfileUrl();
    setState(() {});
  }

  getLoginStatus() {
    if (FirebaseAuth.instance.currentUser != null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: getLoginStatus()
          ? GuestProfile()
          : Column(
              children: [
                SizedBox(
                  height: 240,
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          "images/cuisine/italian.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3, //8
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(myProfilePic),
                                ),
                              ),
                            ),
                            Text(
                              myName,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              myEmail,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ProfileMenuItem(
                  title: "Added Recipes",
                ),
                ProfileMenuItem(
                  title: "Favourite Recipies",
                ),
                ProfileMenuItem(
                  title: "Help Center",
                ),
              ],
            ),
    );
  }
}
