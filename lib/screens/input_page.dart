import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/components/Reusable_Card.dart';
import 'package:bmi_calculator/components/bottomButton.dart';
import 'package:bmi_calculator/components/card_details.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

import 'result_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender;
  double height = 180;
  double weight = 80;
  double age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  child: CardDetails(
                    cardIcon: Icons.male,
                    cardText: "MALE",
                  ),
                  onPress: () {
                    setState(() {
                      gender = Gender.male;
                    });
                    debugPrint("PRESSED MALE!");
                  },
                  color: gender == Gender.male ? kTapCardColour : kCardColour,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  child: CardDetails(
                    cardIcon: Icons.female,
                    cardText: "FEMALE",
                  ),
                  onPress: () {
                    setState(() {
                      gender = Gender.female;
                    });
                    debugPrint("PRESSED FEMALE!");
                  },
                  color: gender == Gender.female ? kTapCardColour : kCardColour,
                ),
              ),
            ],
          ),
          ReusableCard(
            child: Column(
              children: [
                Text("HEIGHT"),
                Text(height.toStringAsFixed(2)),
                Slider(
                  value: height,
                  min: 120,
                  max: 220,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue;
                    });
                  },
                ),
              ],
            ),
            color: kCardColour,
            onPress: () {
              debugPrint("PRESSED SLIDER!");
            },
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Text("Weight"),
                        Text(weight.toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                          ],
                        )
                      ]),
                    ),
                    onPress: () => {},
                    color: kCardColour),
              ),
              Expanded(
                child: ReusableCard(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Text("Age"),
                        Text(age.toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                          ],
                        )
                      ]),
                    ),
                    onPress: () => {
                          debugPrint("PRESSED AGE!"),
                    },
                    color: kCardColour),
              ),
            ],
          ),
          BottomButton(
            onTap: () {
              var brain = CalculatorBrain(weight: weight.toInt(), height: height.toInt());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: brain.calculateBMI(),
                  ),
                ),
              );
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
