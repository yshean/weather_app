import 'package:flutter/material.dart';

class ManageCityPage extends StatelessWidget {
  const ManageCityPage({Key? key}) : super(key: key);

  static PageRoute get route =>
      MaterialPageRoute(builder: (context) => const ManageCityPage());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Manage City'),
    );
  }
}
