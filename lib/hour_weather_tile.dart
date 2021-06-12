import 'package:flutter/material.dart';
import 'package:weather_app/utils.dart';

import 'constants.dart';
import 'models/hour_weather.dart';

class HourWeatherTile extends StatelessWidget {
  final HourWeather hourWeather;

  const HourWeatherTile({
    Key? key,
    required this.hourWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        gradient: tileGradient,
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.2),
        border: Border.all(
          width: 1.0,
          color: Colors.white.withOpacity(0.2),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hourWeather.hour,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
          Image.asset(getWeatherIconPath(hourWeather.weatherType)),
          Text(
            hourWeather.weatherDescription,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '${hourWeather.temperature}°',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
