import 'package:flutter/material.dart';
import 'package:ghost_talks/signup/sign_up.dart';

class WelcomeScreen4 extends StatefulWidget {
  const WelcomeScreen4({super.key});

  @override
  State<WelcomeScreen4> createState() => _WelcomeScreen4State();
}

class _WelcomeScreen4State extends State<WelcomeScreen4> {
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
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: ((() {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: ((context) {
                              return const SignUpPage();
                            })));
                          })),
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Color(0XFF46ECE2),
                              ),
                              fixedSize: MaterialStatePropertyAll(
                                  Size.fromHeight(50))),
                          child: const Text(
                            'Next',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text.rich(
                          TextSpan(
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
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
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
