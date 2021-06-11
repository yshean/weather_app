import 'package:flutter/material.dart';

class UnknownPage extends Page {
  UnknownPage() : super(key: ValueKey('ManageCity'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => UnknownScreen(),
    );
  }
}

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Unknown page'),
    );
  }
}
