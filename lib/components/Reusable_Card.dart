//Stateless or Stateful Widget?
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({Key? key, required this.child, required this.onPress, required this.color}) : super(key: key);

  Widget child;
  Function() onPress;
  Color color;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

