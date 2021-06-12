import 'images.dart';
import 'models/enums.dart';

String getWeatherIconPath(WeatherType weatherType) {
  switch (weatherType) {
    case WeatherType.sunny:
      return Images.sun;
    case WeatherType.sunnyWithCloud:
      return Images.sunWithCloud;
    case WeatherType.cloudy:
      return Images.cloud;
    default:
      throw Exception('Unknown WeatherType: $weatherType');
  }
}
