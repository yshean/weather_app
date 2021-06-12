import 'package:flutter/material.dart';
import 'package:weather_app/home_page.dart';
import 'package:weather_app/manage_city_page.dart';
import 'package:weather_app/models/city_weather.dart';
import 'package:weather_app/unknown_page.dart';

import 'constants.dart';

abstract class Routes {
  static const String home = '/';
  static const String manageCity = '/manage-city';
}

abstract class Routing {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        final Map<String, dynamic>? args = settings.arguments == null
            ? {}
            : settings.arguments as Map<String, dynamic>;
        return HomePage(
          backgroundGradient: backgroundGradient,
          cityWeather: args?['cityWeather'] == null
              ? null
              : args?['cityWeather'] as CityWeather,
        ).route;
      case Routes.manageCity:
        return ManageCityPage.route;
      default:
        return UnknownPage.route;
    }
  }
}
