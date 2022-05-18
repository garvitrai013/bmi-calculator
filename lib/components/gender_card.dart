import 'package:flutter/material.dart';
import 'constants.dart';

class GenderCard extends StatelessWidget {
  const GenderCard(
      {required this.genderIcon, required this.genderText, Key? key})
      : super(key: key);
  final IconData genderIcon;
  final String genderText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(genderIcon, size: 70.0),
        const SizedBox(
          height: 15,
        ),
        Text(
          genderText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
