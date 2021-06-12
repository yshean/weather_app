import 'package:flutter/material.dart';
import 'package:weather_app/city_weather_tile.dart';
import 'package:weather_app/models/city_weather.dart';
import 'package:weather_app/models/enums.dart';
import 'package:weather_app/routing.dart';

import 'action_button.dart';
import 'constants.dart';

class ManageCityPage extends StatefulWidget {
  ManageCityPage({Key? key}) : super(key: key);

  static PageRoute get route =>
      MaterialPageRoute(builder: (context) => ManageCityPage());

  @override
  _ManageCityPageState createState() => _ManageCityPageState();
}

class _ManageCityPageState extends State<ManageCityPage> {
  List<CityWeather> cityWeathers = [
    CityWeather(
      cityName: 'Kuala Lumpur',
      temperature: 34,
      weatherType: WeatherType.cloudy,
      weatherDescription: 'Partly cloudy',
    ),
    CityWeather(
      cityName: 'Putrajaya',
      temperature: 37,
      weatherType: WeatherType.sunny,
      weatherDescription: 'Mostly Sunny',
    ),
  ];

  final _formKey = GlobalKey<FormState>();

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
              child: ListView.separated(
                itemBuilder: (_, index) => CityWeatherTile(
                  cityWeather: cityWeathers[index],
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.home,
                      (route) => route.settings.name == Routes.home,
                      arguments: {'cityWeather': cityWeathers[index]},
                    );
                  },
                ),
                separatorBuilder: (_, __) => SizedBox(height: 16.0),
                itemCount: cityWeathers.length,
              ),
            ),
            ActionButton(
              label: 'Add city',
              onPressed: () async {
                final CityWeather? result = await showDialog(
                  context: context,
                  builder: (_) => Form(
                    key: _formKey,
                    child: AlertDialog(
                      title: Text('Enter a city name'),
                      content: TextFormField(
                        decoration: InputDecoration(hintText: "Cyberjaya"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field cannot be empty';
                          }
                          return null;
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pop(
                                context,
                                CityWeather(
                                  cityName: 'Cyberjaya',
                                  temperature: 32,
                                  weatherType: WeatherType.sunnyWithCloud,
                                  weatherDescription: 'Foggy',
                                ),
                              );
                            }
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  ),
                );
                if (result is CityWeather) {
                  setState(() {
                    cityWeathers.add(result);
                  });
                }
              },
            ),
            SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}
