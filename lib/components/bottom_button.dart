import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final String labelText;
  final Function? onTap;
  const BottomButton({
    required this.labelText,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        child: Center(
          child: Text(
            labelText,
            style: kBottomButtonTextStyle,
          ),
        ),
        height: 80.0,
        margin: const EdgeInsets.only(top: 10.0),
        color: const Color(kBottomContainerColor),
      ),
    );
  }
}
