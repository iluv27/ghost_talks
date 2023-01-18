import 'package:ghost_talks/constants.dart';
import 'package:flutter/material.dart';
import 'package:ghost_talks/welcome/screen4.dart';

class WelcomeScreen3 extends StatelessWidget {
  const WelcomeScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomeDefault(
      decorationCode: 3,
      colorCode: 2,
      welcomeText:
          'Have real conversations with anyone without fear of judgement',
      textSpan: const TextSpan(
        children: [
          TextSpan(
            text: '>>>>>>>>>>>>',
            style: TextStyle(
              fontSize: 18,
              color: Color(0XFF46ECE2),
            ),
          ),
        ],
      ),
      elevatedbutton: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) {
          return const WelcomeScreen4();
        })));
      },
      buttonText: 'Next',
    );
  }
}
