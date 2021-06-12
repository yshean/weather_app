import 'package:flutter/material.dart';
import 'package:weather_app/city_weather_tile.dart';
import 'package:weather_app/models/city_weather.dart';
import 'package:weather_app/models/enums.dart';

import 'action_button.dart';
import 'constants.dart';

class ManageCityPage extends StatelessWidget {
  const ManageCityPage({Key? key}) : super(key: key);

  static PageRoute get route =>
      MaterialPageRoute(builder: (context) => const ManageCityPage());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(gradient: backgroundGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Manage City'),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            SizedBox(height: 20.0),
            Expanded(
              child: ListView(
                children: [
                  CityWeatherTile(
                    cityWeather: CityWeather(
                      cityName: 'Putrajaya',
                      temperature: 37,
                      weatherType: WeatherType.sunny,
                      weatherDescription: 'Mostly Sunny',
                    ),
                  ),
                ],
              ),
            ),
            ActionButton(
              label: 'Add city',
              onPressed: () {},
            ),
            SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}
