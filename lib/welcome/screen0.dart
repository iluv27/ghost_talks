import 'package:flutter/material.dart';

class WelcomeScreen0 extends StatelessWidget {
  const WelcomeScreen0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bgcolor.png'), fit: BoxFit.fill),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'images/logo.png',
                    scale: 2,
                  ),
                  const Text(
                    'Connect with friends anonymously',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    '>>>>>>>>>>>>',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
