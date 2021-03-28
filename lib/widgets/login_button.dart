import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LogInButton extends StatelessWidget {
  String label;
  String image;
  double size;
  Function onPressed;
  LogInButton({this.label, this.size = 300.0, this.onPressed, this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      child: MaterialButton(
        height: 60.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(15.0),
        color: Colors.redAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(image),
              height: 40,
              width: 50,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            )
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
