import 'package:flutter/material.dart';
import 'package:ghost_talks/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          //Background image
          decoration: decorationProperty(3),
          child: Center(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.only(top: 130.0, left: 40),
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 5,
              ),

              // The body of the input form
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ),
                  ),
                  child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const InputField(
                              innerText: 'Enter Full Name',
                              validatorText: 'Please enter your full name',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const InputField(
                              innerText: 'Enter Email',
                              validatorText: 'Please enter your email',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const InputField(
                              innerText: 'Enter Password',
                              validatorText: 'Please enter your password',
                            ),
                            CheckboxListTile(
                              side: const BorderSide(color: Colors.black),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              selected: true,
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value;
                                });
                              },
                              title: const Text(
                                "I accept the terms and conditions  of GhostTalks",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            ButtomButton(
                              elevatedbutton: (() {}),
                              buttonText: 'Sign Up',
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: const [
                                Expanded(
                                    child: Divider(
                                  color: Colors.black45,
                                  thickness: 0.8,
                                )),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    "OR",
                                    style: TextStyle(
                                      color: Colors.black26,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.black45,
                                    thickness: 0.8,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.ac_unit,
                                    size: 64,
                                    color: Colors.black45,
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.ac_unit,
                                    size: 64,
                                    color: Colors.black45,
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.ac_unit,
                                    size: 64,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField(
      {Key? key, required this.innerText, required this.validatorText})
      : super(key: key);

  final String innerText;
  final String validatorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }

  OutlineInputBorder outlinedInputBorder(color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, style: BorderStyle.solid, width: 1),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
