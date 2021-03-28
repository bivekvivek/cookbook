import 'package:cookbook/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/widgets/cuisine_card.dart';
import 'package:cookbook/widgets/fav_recipe_box.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(height: 245.0, color: Colors.redAccent),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(24.0),
                      child: TextFormField(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchPage(),
                            ),
                          );
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search, color: Colors.black),
                            contentPadding:
                                EdgeInsets.only(left: 15.0, top: 15.0),
                            hintText: 'Search for recipes',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Colors.yellow,
                                  style: BorderStyle.solid,
                                  width: 3.0))),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'POPULAR RECIPES',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15.0, left: 15.0),
                    height: 125.0,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        FavRecipe(
                          favRecipe: "Panner Masala",
                          favCuisine: "North Indian",
                          favRecipeImg: "images/recipe/pannerMasala.png",
                          favRecipeTime: "20 Mins",
                        ),
                        SizedBox(width: 9.0),
                        FavRecipe(
                          favRecipe: "Dosa",
                          favCuisine: "South Indian",
                          favRecipeImg: "images/recipe/dosa.png",
                          favRecipeTime: "30 Mins",
                        ),
                        SizedBox(width: 9.0),
                        FavRecipe(
                          favRecipe: "Pasta",
                          favCuisine: "Italian",
                          favRecipeImg: "images/recipe/pasta.png",
                          favRecipeTime: "40 Mins",
                        ),
                        SizedBox(width: 9.0),
                        FavRecipe(
                          favRecipe: "Momos",
                          favCuisine: "Chinese",
                          favRecipeImg: "images/recipe/momos.png",
                          favRecipeTime: "35 Mins",
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: Colors.red,
                          style: BorderStyle.solid,
                          width: 3.0))),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CUISINES',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 25.0),
          CuisineBox(
            cuisineName: "North Indian",
            cuisineImage: "images/cuisine/north_indian.png",
            cuisPressed: () {},
          ),
          SizedBox(height: 10),
          CuisineBox(
            cuisineName: "South Indian",
            cuisineImage: "images/cuisine/south_indian.png",
            cuisPressed: () {},
          ),
          SizedBox(height: 10),
          CuisineBox(
            cuisineName: "Italian",
            cuisineImage: "images/cuisine/italian.png",
            cuisPressed: () {},
          ),
          SizedBox(height: 10),
          CuisineBox(
            cuisineName: "Chinese",
            cuisineImage: "images/cuisine/chinese.png",
            cuisPressed: () {},
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}
