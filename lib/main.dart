import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/result_page.dart';

void main() => runApp(const BMICalculator());
ThemeData theme = ThemeData.dark();

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
          primaryColor: const Color(0xFF0A0D22),
          scaffoldBackgroundColor: const Color(0xFF0a0d22),
          platform: TargetPlatform.iOS,
          colorScheme:
              theme.colorScheme.copyWith(secondary: const Color(0xFFEB1555))),
      initialRoute: '/',
      routes: {
        '/': (context) => const InputPage(),
        '/result': (context) => const ResultPage()
      },
    );
  }
}
