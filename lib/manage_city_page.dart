import 'package:flutter/material.dart';

class ManageCityPage extends Page {
  ManageCityPage() : super(key: ValueKey('ManageCity'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => ManageCityScreen(),
    );
  }
}

class ManageCityScreen extends StatelessWidget {
  const ManageCityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Manage City'),
    );
  }
}
