import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String title;
  const Profile(this.title, {Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String get title => this.title;
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
