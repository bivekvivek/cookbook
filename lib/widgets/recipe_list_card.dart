import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class RecipeListCard extends StatelessWidget {
  final String recipeName;
  final String recipeCuisine;
  final String recipeImg;
  final String recipePrepTime;
  final String addedBy;

  const RecipeListCard(
      {Key key,
      this.recipeName = "Panner Name",
      this.recipeCuisine = "North Indian",
      this.recipeImg = "images/recipe/pannerMasala.png",
      this.recipePrepTime = "20 Mins",
      this.addedBy = "Bivek Kumar"})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(5),
        height: 172.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 1),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(recipeImg), fit: BoxFit.cover)),
              height: 172.0,
              width: 155.0,
            ),
            SizedBox(width: 15.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  recipeName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 2.0,
                  width: 85.0,
                  color: Colors.redAccent,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 5.0),
                    Text(
                      recipeCuisine,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timer,
                      size: 15,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      recipePrepTime,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black54),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("By"),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      addedBy,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 12,
            ),
            Row(
              children: [
                FavoriteButton(
                  iconSize: 40.0,
                  isFavorite: false,
                  valueChanged: (_isFavorite) {
                    print('Added to favourite list : $_isFavorite');
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
