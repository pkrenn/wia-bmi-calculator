import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottomButton.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text("Calculated!")
      ),
    );
  }
}
