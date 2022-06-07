import 'package:flutter/material.dart';

Widget createDrawerBodyItem(
    {required IconData icon, String? text, required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text!),
        )
      ],
    ),
    onTap: onTap,
  );
}
