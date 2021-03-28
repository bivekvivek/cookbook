import 'package:cookbook/constants.dart';
import 'package:cookbook/home.dart';
import 'package:cookbook/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/helperFunctions/auth.dart';
import 'package:flutter_restart/flutter_restart.dart';

class LaunchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 400,
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Text(
                kAppName,
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              child: Image(
                image: AssetImage("images/login/cover.png"),
                height: 200,
                width: 700,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            LogInButton(
                label: "Google Sign In",
                image: "images/login/google.png",
                onPressed: () async {
                  await AuthMethods().signInWithGoogle(context);
                  FlutterRestart.restartApp();
                }),
            SizedBox(
              height: 20,
            ),
            LogInButton(
                label: "Guest Sign In",
                image: "images/login/guest.png",
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }),
            SizedBox(
              height: 155,
            ),
            Text("A Recipe Hand Book by $kAppDeveloper",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.grey[100]))
          ],
        ),
      ),
    );
  }
}
