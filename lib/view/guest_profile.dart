import 'package:cookbook/helperFunctions/auth.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/widgets/login_button.dart';

class GuestProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        Center(
          child: Text(
            "Sorry!!",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Text(
          "You have to login first",
          style: TextStyle(fontSize: 18),
        ),
        Center(
          child: Image.asset("images/login/sad.png"),
        ),
        LogInButton(
            label: "Google Sign In",
            image: "images/login/google.png",
            onPressed: () {
              AuthMethods().signInWithGoogle(context);
            }),
      ],
    );
  }
}
