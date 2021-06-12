import 'package:flutter/material.dart';
import 'package:weather_app/utils.dart';

import 'constants.dart';
import 'models/city_weather.dart';

class CityWeatherTile extends StatelessWidget {
  final CityWeather cityWeather;
  final void Function() onTap;

  const CityWeatherTile({
    Key? key,
    required this.cityWeather,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          gradient: tileGradient,
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.2),
          border: Border.all(
            width: 1.0,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cityWeather.cityName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 20.0),
            Container(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        getWeatherIconPath(cityWeather.weatherType),
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        '${cityWeather.temperature}°',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    cityWeather.weatherDescription,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
