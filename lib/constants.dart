import 'package:flutter/material.dart';

//Welcome page for screen 1-3
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

//Button for the buttom button of the welcome pages
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

//Background image of the welcome pages
BoxDecoration decorationProperty(int decNumber) {
  return BoxDecoration(
    image: DecorationImage(
        image: AssetImage('images/bgcolor$decNumber.png'), fit: BoxFit.fill),
  );
}

//Button for the signup and log in pages
class IconButtonType {
  String? iconImage;
  double? iconsSize;
  Function()? iconFunction;
  IconButton iconButton() {
    return IconButton(
      iconSize: iconsSize,
      onPressed: (iconFunction),
      icon: Image.asset('images/$iconImage.png'),
    );
  }

  IconButtonType({this.iconImage, this.iconsSize, this.iconFunction});
}

//Input field of the sign up and log in pages
class InputField extends StatelessWidget {
  const InputField(
      {Key? key, required this.innerText, required this.validatorText})
      : super(key: key);

  final String innerText;
  final String validatorText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        cursorWidth: 1.5,
        cursorHeight: 20,
        cursorColor: const Color.fromARGB(255, 36, 128, 121),
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
          labelText: innerText,
          floatingLabelStyle: const TextStyle(
            color: Color.fromARGB(221, 24, 38, 37),
          ),
          labelStyle: const TextStyle(color: Colors.black26),
          focusedBorder: outlinedInputBorder(
            Colors.black26,
          ),
          enabledBorder: outlinedInputBorder(
            Colors.black26,
          ),
          errorBorder: outlinedInputBorder(
            const Color.fromARGB(66, 235, 62, 62),
          ),
          focusedErrorBorder: outlinedInputBorder(
            const Color.fromARGB(66, 235, 62, 62),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return validatorText;
          }
          return null;
        },
      ),
    );
  }

  OutlineInputBorder outlinedInputBorder(color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, style: BorderStyle.solid, width: 1),
      borderRadius: BorderRadius.circular(20),
    );
  }
}

//Checkbox Widget I made to customize the text
class CheckBoxListTile extends StatefulWidget {
  const CheckBoxListTile({super.key, required this.text});
  final Widget? text;
  @override
  State<CheckBoxListTile> createState() => _CheckBoxListTileState();
}

class _CheckBoxListTileState extends State<CheckBoxListTile> {
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      side: const BorderSide(color: Colors.black),
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      selected: true,
      value: _isChecked,
      onChanged: (bool? value) {
        setState(() {
          _isChecked = value;
        });
      },
      title: widget.text,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
