import 'package:weather_app/models/enums.dart';

class CityWeather {
  final String cityName;
  final int temperature;
  final WeatherType weatherType;
  final String weatherDescription;

  CityWeather({
    required this.cityName,
    required this.temperature,
    required this.weatherType,
    required this.weatherDescription,
  });
}
