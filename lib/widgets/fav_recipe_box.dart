import 'package:flutter/material.dart';

class FavRecipe extends StatelessWidget {
  final String favRecipe;
  final String favCuisine;
  final String favRecipeImg;
  final String favRecipeTime;
  FavRecipe(
      {this.favCuisine, this.favRecipe, this.favRecipeImg, this.favRecipeTime});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black,
      onTap: () {},
      child: Container(
        height: 125.0,
        width: 250.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Colors.redAccent, width: 3),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(favRecipeImg), fit: BoxFit.cover)),
              height: 125.0,
              width: 100.0,
            ),
            SizedBox(width: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  favRecipe,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Container(
                  height: 2.0,
                  width: 85.0,
                  color: Colors.redAccent,
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 5.0),
                    Text(
                      favCuisine,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 14,
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
                      favRecipeTime,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black54),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
