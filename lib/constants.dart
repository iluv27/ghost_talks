import 'package:flutter/material.dart';

class WelcomeDefault extends StatelessWidget {
  const WelcomeDefault(
      {Key? key,
      required this.colorCode,
      required this.welcomeText,
      required this.textSpan,
      this.elevatedbutton,
      this.decorationCode,
      this.buttonText})
      : super(key: key);

  final int colorCode;
  final int? decorationCode;
  final String welcomeText;
  final TextSpan textSpan;
  final Function()? elevatedbutton;
  final String? buttonText;

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
                        ButtomButton(
                          elevatedbutton: elevatedbutton,
                          buttonText: buttonText,
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

class ButtomButton extends StatelessWidget {
  const ButtomButton({Key? key, required this.elevatedbutton, this.buttonText})
      : super(key: key);

  final Function()? elevatedbutton;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (elevatedbutton),
      style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          backgroundColor: const MaterialStatePropertyAll(
            Color(0XFF46ECE2),
          ),
          fixedSize: const MaterialStatePropertyAll(Size.fromHeight(57)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ))),
      child: Text(
        buttonText.toString(),
        style: const TextStyle(
            color: Color.fromARGB(179, 15, 24, 24), fontSize: 16),
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
