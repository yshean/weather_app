import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  static PageRoute get route =>
      MaterialPageRoute(builder: (context) => const UnknownPage());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Unknown page'),
    );
  }
}
