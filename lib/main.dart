import 'package:flutter/material.dart';

import 'routing.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather app',
      onGenerateRoute: Routing.generateRoute,
      initialRoute: Routes.home,
    );
  }
}
