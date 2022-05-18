import 'package:bmi_calculator/components/bmi_brain.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../components/gender_card.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';

enum GenderType { unselected, male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColor = const Color(inactiveCardColour);
  // Color femaleCardColor = const Color(inactiveCardColour);
  GenderType cardSelected = GenderType.unselected;
  int height = 150;
  int weight = 60;
  int age = 20;

  // void updateColor(GenderType cardPressed) {
  //   if (cardPressed == GenderType.male) {
  //     if (maleCardColor == const Color(inactiveCardColour)) {
  //       maleCardColor = const Color(activeCardColour);
  //       femaleCardColor = const Color(inactiveCardColour);
  //     } else {
  //       maleCardColor = const Color(inactiveCardColour);
  //     }
  //   } else if (cardPressed == GenderType.female) {
  //     if (femaleCardColor == const Color(inactiveCardColour)) {
  //       femaleCardColor = const Color(activeCardColour);
  //       maleCardColor = const Color(inactiveCardColour);
  //     } else {
  //       femaleCardColor = const Color(inactiveCardColour);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0D22),
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: Color(cardSelected == GenderType.male
                        ? kActiveCardColour
                        : kInactiveCardColour),
                    onTap: () {
                      setState(() {
                        cardSelected = GenderType.male;
                      });
                    },
                    childCard: const GenderCard(
                      genderIcon: FontAwesomeIcons.mars,
                      genderText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: Color(cardSelected == GenderType.female
                        ? kActiveCardColour
                        : kInactiveCardColour),
                    onTap: () {
                      setState(() {
                        cardSelected = GenderType.female;
                      });
                    },
                    childCard: const GenderCard(
                        genderIcon: FontAwesomeIcons.venus,
                        genderText: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: const Color(kCardBackgroundColor),
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        overlayColor: const Color(0x29EB1555),
                        thumbColor: const Color(kBottomContainerColor),
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 20),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                        value: height.toDouble(),
                        max: 250,
                        min: 50,
                        activeColor: const Color(0xFFEB1555),
                        inactiveColor: const Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: ReusableCard(
                  color: const Color(kCardBackgroundColor),
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  color: const Color(kCardBackgroundColor),
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          BottomButton(
            labelText: 'CALCULATE',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                      bmiBrain: BMIBrain(height: height, weight: weight)),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
