import 'package:flutter/material.dart';
import 'package:loginui/onBoarding.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: SplashScreen(
          seconds: 8,
          navigateAfterSeconds: OnBoarding(),
          title: new Text(
            "Food Delivery App",
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.orange),
          ),
          image: Image.asset('images/fooddelivery.png'),
          styleTextUnderTheLoader: new TextStyle(),
          loaderColor: Colors.orange),
    );
  }
}
