import 'package:flutter/material.dart';

const purple = Color.fromRGBO(100, 12, 170, 1);

const blue = Color.fromRGBO(0, 9, 234, 0.79);

const backgroundGradient = LinearGradient(
  colors: [
    purple,
    blue,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const tileGradient = LinearGradient(
  colors: [
    Colors.white,
    Colors.white70,
    Colors.white,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
