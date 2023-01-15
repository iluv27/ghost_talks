import 'package:flutter/material.dart';
import 'package:ghost_talks/welcome/screen1.dart';
import 'dart:async';

class WelcomeScreen0 extends StatefulWidget {
  const WelcomeScreen0({super.key});

  @override
  State<WelcomeScreen0> createState() => _WelcomeScreen0State();
}

class _WelcomeScreen0State extends State<WelcomeScreen0> {
  @override
  void initState() {
    super.initState();
    loader();
  }

  route() {
    Navigator.push(context, MaterialPageRoute(builder: ((context) {
      return const WelcomeScreen1();
    })));
  }

  loader() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  @override
  Widget build(BuildContext context) {
    return const Loader();
  }
}

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
  }) : super(key: key);

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
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
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
