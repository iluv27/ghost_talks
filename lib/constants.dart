import 'package:flutter/material.dart';

class WelcomeDefault extends StatelessWidget {
  const WelcomeDefault(
      {Key? key,
      required this.colorCode,
      required this.welcomeText,
      required this.textSpan,
      this.elevatedbutton,
      this.decorationCode})
      : super(key: key);

  final int colorCode;
  final int? decorationCode;
  final String welcomeText;
  final TextSpan textSpan;
  final Function()? elevatedbutton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: decorationProperty(colorCode),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Image.asset(
                      'images/decoration$decorationCode.png',
                      scale: 4.5,
                    ),
                  ),
                  Text(
                    welcomeText,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          onPressed: (elevatedbutton),
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
                          height: 30,
                        ),
                        Text.rich(
                          textSpan,
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

BoxDecoration decorationProperty(int decNumber) {
  return BoxDecoration(
    image: DecorationImage(
        image: AssetImage('images/bgcolor$decNumber.png'), fit: BoxFit.fill),
  );
}
