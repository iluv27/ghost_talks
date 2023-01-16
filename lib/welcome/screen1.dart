import 'package:ghost_talks/constants.dart';
import 'package:flutter/material.dart';
import 'package:ghost_talks/welcome/screen2.dart';

class WelcomeScreen1 extends StatelessWidget {
  const WelcomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomeDefault(
      decorationCode: 1,
      colorCode: 1,
      welcomeText:
          'Talk to anyone, at anyplace, and at anytime with confidence.',
      textSpan: const TextSpan(
        children: [
          TextSpan(
            text: '>>>>',
            style: TextStyle(
              fontSize: 18,
              color: Color(0XFF46ECE2),
            ),
          ),
          TextSpan(
            text: '>>>>>>>>',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
        ],
      ),
      elevatedbutton: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) {
          return const WelcomeScreen2();
        })));
      },
    );
  }
}
