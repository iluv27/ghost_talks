import 'package:ghost_talks/constants.dart';
import 'package:flutter/material.dart';
import 'package:ghost_talks/welcome/screen3.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomeDefault(
      decorationCode: 2,
      colorCode: 2,
      welcomeText: 'Seek support and constructive criticism to know better.',
      textSpan: const TextSpan(
        children: [
          TextSpan(
              text: '>>>>>>>>',
              style: TextStyle(
                fontSize: 18,
                color: Color(0XFF46ECE2),
              )),
          TextSpan(
              text: '>>>>',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              )),
        ],
      ),
      elevatedbutton: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) {
          return const WelcomeScreen3();
        })));
      },
      buttonText: 'Next',
    );
  }
}
