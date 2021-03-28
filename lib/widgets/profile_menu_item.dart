import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  const ProfileMenuItem({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        child: Row(
          children: [
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
