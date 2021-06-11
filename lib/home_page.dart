import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';

import 'circle_tab_indicator.dart';
import 'hour_weather_tile.dart';

enum MenuOption { manageCity }

class HomePage extends Page {
  final ValueChanged<String> onTapped;
  final LinearGradient backgroundGradient;

  HomePage({required this.onTapped, required this.backgroundGradient})
      : super(key: ValueKey('Home'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => HomeScreen(
        backgroundGradient: backgroundGradient,
        onTapped: onTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final ValueChanged<String>? onTapped;
  final LinearGradient backgroundGradient;

  const HomeScreen({
    Key? key,
    this.onTapped,
    required this.backgroundGradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(gradient: backgroundGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Malaysia'.toUpperCase(),
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
                    if (onTapped != null) onTapped!(Routes.manageCity);
                    // Navigator.of(context).push(ManageCityPage.route());
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mostly Sunny',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          'Friday, 30 April',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '40°',
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
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      HourWeatherTile(),
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
