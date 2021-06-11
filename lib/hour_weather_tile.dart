import 'package:flutter/material.dart';

class HourWeatherTile extends StatelessWidget {
  static const tileGradient = LinearGradient(
    colors: [
      Colors.white,
      Colors.white70,
      Colors.white,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '01:00',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
          Image.asset('assets/images/sun.png'),
          Text(
            'Mostly Sunny',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '37°',
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
