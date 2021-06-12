import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/action_button.dart';
import 'package:weather_app/hour_weather_tile.dart';
import 'package:weather_app/models/city_weather.dart';
import 'package:weather_app/models/enums.dart';

import 'circle_tab_indicator.dart';
import 'models/hour_weather.dart';
import 'routing.dart';

enum MenuOption { manageCity }

class HomePage extends StatefulWidget {
  final ValueChanged<String>? onTapped;
  final LinearGradient backgroundGradient;
  final CityWeather? cityWeather;

  const HomePage({
    Key? key,
    this.onTapped,
    required this.backgroundGradient,
    this.cityWeather,
  }) : super(key: key);

  PageRoute get route => MaterialPageRoute(
        builder: (context) => HomePage(
          backgroundGradient: backgroundGradient,
          cityWeather: cityWeather,
        ),
      );

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isTodaySelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(gradient: widget.backgroundGradient),
      child: widget.cityWeather == null
          ? Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  'Get started'.toUpperCase(),
                  style: TextStyle(
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                actions: [
                  PopupMenuButton(
                    onSelected: (value) {
                      switch (value) {
                        case MenuOption.manageCity:
                          Navigator.of(context).pushNamed(Routes.manageCity);
                          break;
                        default:
                          break;
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: MenuOption.manageCity,
                        child: Text('Manage City'),
                      ),
                    ],
                  )
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select a city in Manage City to get started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.0),
                  ActionButton(
                    label: 'Manage City',
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.manageCity);
                    },
                  ),
                ],
              ),
            )
          : Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  widget.cityWeather!.cityName.toUpperCase(),
                  style: TextStyle(
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                actions: [
                  PopupMenuButton(
                    onSelected: (value) {
                      switch (value) {
                        case MenuOption.manageCity:
                          Navigator.of(context).pushNamed(Routes.manageCity);
                          break;
                        default:
                          break;
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: MenuOption.manageCity,
                        child: Text('Manage City'),
                      ),
                    ],
                  )
                ],
              ),
              body: Center(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.cityWeather!.weatherDescription,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 24.0,
                                  ),
                                ),
                                SizedBox(height: 6.0),
                                Text(
                                  // 'dasadsfdsfsfdfsfdfdssddsadsadasdas',
                                  // overflow: TextOverflow.ellipsis,
                                  // https://stackoverflow.com/questions/16126579/how-do-i-format-a-date-with-dart
                                  DateFormat('EEEE, d MMMM')
                                      .format(DateTime.now()),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '${widget.cityWeather!.temperature}°',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 72.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60.0),
                      DefaultTabController(
                        length: 2,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TabBar(
                                isScrollable: true,
                                // indicator: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(
                                //     25.0,
                                //   ),
                                //   color: Colors.green,
                                // ),
                                indicator: CircleTabIndicator(
                                  color: Colors.cyan,
                                  radius: 6.0,
                                ),
                                tabs: [
                                  Tab(
                                    icon: Text(
                                      'Today',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    icon: Text(
                                      'Tomorrow',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.0),
                            FutureBuilder<List<HourWeather>>(
                              future: Future<List<HourWeather>>.delayed(
                                Duration(seconds: 3),
                                () => [
                                  HourWeather(
                                    hour: '01:00',
                                    temperature: 37,
                                    weatherDescription: 'Mostly Sunny',
                                    weatherType: WeatherType.sunny,
                                  ),
                                  HourWeather(
                                    hour: '02:00',
                                    temperature: 34,
                                    weatherDescription: 'Partly Cloudy',
                                    weatherType: WeatherType.cloudy,
                                  ),
                                  HourWeather(
                                    hour: '03:00',
                                    temperature: 32,
                                    weatherDescription: 'Foggy',
                                    weatherType: WeatherType.sunnyWithCloud,
                                  ),
                                  HourWeather(
                                    hour: '04:00',
                                    temperature: 26,
                                    weatherDescription: 'Mostly Sunny',
                                    weatherType: WeatherType.sunny,
                                  ),
                                ],
                              ),
                              builder: (_, snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    height: 200,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) =>
                                          HourWeatherTile(
                                        hourWeather: snapshot.data![index],
                                      ),
                                      separatorBuilder: (_, __) =>
                                          SizedBox(width: 12.0),
                                      itemCount: snapshot.data?.length ?? 0,
                                    ),
                                  );
                                }
                                return CircularProgressIndicator();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
