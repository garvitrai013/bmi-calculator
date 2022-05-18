import 'package:bmi_calculator/components/bottom_button.dart';
import '../components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/bmi_brain.dart';

class ResultPage extends StatelessWidget {
  final BMIBrain? bmiBrain;

  const ResultPage({this.bmiBrain, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0D22),
        title: const Text('RESULT'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(15),
              child: const Text('Your Result', style: kResultHeadingTextStyle),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              color: const Color(kInactiveCardColour),
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiBrain!.getResult(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiBrain!.getBMI(),
                    style: kResultNumberTextStyle,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Normal BMI Range',
                          style: kLabelTextStyle.copyWith(fontSize: 20),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '18.5 - 25 kg/m\u00B2',
                          style: kActiveLabelTextStyle,
                        )
                      ],
                    ),
                  ),
                  Text(
                    bmiBrain!.getInterpretation(),
                    textAlign: TextAlign.center,
                    style: kActiveLabelTextStyle,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            labelText: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
