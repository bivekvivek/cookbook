import 'package:flutter/material.dart';

class CuisineBox extends StatelessWidget {
  final String cuisineName;
  final String cuisineImage;
  final Function cuisPressed;
  CuisineBox({this.cuisineName, this.cuisineImage, this.cuisPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.deepOrange,
      onTap: () {},
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Container(
              height: 180.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      image: AssetImage(cuisineImage), fit: BoxFit.cover)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  cuisineName,
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      backgroundColor: Colors.grey[600],
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Container(
                  height: 3.0,
                  width: 50.0,
                  color: Colors.red,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
