import 'package:flutter/material.dart';

import 'constants.dart';

class ActionButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;

  const ActionButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: tileGradient,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.2),
          border: Border.all(
            width: 1.0,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                letterSpacing: 3.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
