import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  final String title;
  const Favorites(this.title, {Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  String get title => this.title;
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
