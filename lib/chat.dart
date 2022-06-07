import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final String title;
  const Chat(this.title, {Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String get title => this.title;
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
