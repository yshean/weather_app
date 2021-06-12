import 'enums.dart';

class HourWeather {
  final String hour;
  final WeatherType weatherType;
  final int temperature;
  final String weatherDescription;

  const HourWeather({
    required this.hour,
    required this.weatherType,
    required this.temperature,
    required this.weatherDescription,
  });
}
