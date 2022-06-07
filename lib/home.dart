import 'package:flutter/material.dart';
import 'package:loginui/HomePage.dart';
import 'package:loginui/chat.dart';
import 'package:loginui/favorites.dart';
import 'package:loginui/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final screenText = ["Home", "Favorites", "Chat", "Profile"];

  final screens = [
    HomePage("Home"),
    Favorites("Favorites"),
    Chat("Chat"),
    Profile("Profile")
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(screenText[currentIndex]),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text("title"),
              ),
              ListTile(
                title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Favorites"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Chat"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Profile"),
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xffe58210),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          iconSize: 30,
          selectedFontSize: 20,
          unselectedFontSize: 15,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorites",
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: "Chat",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Colors.green)
          ],
        ),
      );
}
