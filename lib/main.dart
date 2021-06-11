import 'package:flutter/material.dart';
import 'package:weather_app/home_page.dart';

void main() {
  runApp(MyApp());
}

abstract class Routes {
  static const validPaths = [manageCity];

  static const manageCity = 'manage-city';
}

class MyApp extends StatelessWidget {
  static const purple = Color.fromRGBO(100, 12, 170, 1);
  static const blue = Color.fromRGBO(0, 9, 234, 0.79);
  static const backgroundGradient = LinearGradient(
    colors: [
      purple,
      blue,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather app',
      home: HomeScreen(
        backgroundGradient: backgroundGradient,
      ),
    );
  }
}
