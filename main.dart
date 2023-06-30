import 'package:flutter/material.dart';
import 'package:geo_locator/Screens/landingScreen.dart';
import 'Screens/leading_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow,

        appBarTheme: const AppBarTheme(
          color: Colors.cyan,
          elevation: 0,
        ),
      ),
      home: LandingScreen(),
    );
  }
}

