// ignore_for_file: unused_field, unused_element, no_leading_underscores_for_local_identifiers, avoid_print, unused_local_variable, unnecessary_null_comparison

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ghost_talks/chat/chat_screen.dart';
import 'package:ghost_talks/constants.dart';
import 'package:ghost_talks/signup/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ModalProgressHUD(
          color: const Color(0XFF46ECE2),
          inAsyncCall: showSpinner,
          child: Container(
            //Background image
            decoration: decorationProperty(3),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 130.0, left: 40),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w600),
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
                                InputField(
                                  textEditingController: fullName,
                                  onInputChanged: ((value) {
                                    value = fullName.text;
                                  }),
                                  innerText: 'Enter Full Name',
                                  validatorText: 'Please enter your full name',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InputField(
                                  textEditingController: email,
                                  onInputChanged: ((value) {
                                    value = email.text;
                                  }),
                                  innerText: 'Enter Email',
                                  validatorText: 'Please enter your email',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InputField(
                                  textEditingController: password,
                                  onInputChanged: ((value) {
                                    value = password.text;
                                  }),
                                  innerText: 'Enter Password',
                                  validatorText: 'Please enter your password',
                                ),
                                const CheckBoxListTile(
                                  text: Text(
                                    "I accept the terms and conditions  of GhostTalks",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                ButtomButton(
                                  elevatedbutton: (() async {
                                    setState(() {
                                      showSpinner = true;
                                    });
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      // Send data to the server
                                    }
                                    try {
                                      final newUser = await _auth
                                          .createUserWithEmailAndPassword(
                                              email: email.text,
                                              password: password.text);
                                      if (newUser != null) {
                                        // ignore: use_build_context_synchronously
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: ((context) {
                                              return const ChatScreen();
                                            }),
                                          ),
                                        );
                                      }
                                      setState(() {
                                        showSpinner = false;
                                      });
                                    } catch (e) {
                                      print(e);
                                    }
                                  }),
                                  buttonText: 'Sign Up',
                                ),
                                const SizedBox(
                                  height: 30,
                                ),

                                //Divider For OR
                                Row(
                                  children: const [
                                    Expanded(
                                        child: Divider(
                                      color: Colors.black45,
                                      thickness: 0.8,
                                    )),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
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
                                const Center(
                                  child: Text(
                                    'Sign up with:',
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 16),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButtonType(
                                            iconsSize: 50,
                                            iconImage: 'facebook')
                                        .iconButton(),
                                    IconButtonType(
                                            iconsSize: 70, iconImage: 'google')
                                        .iconButton(),
                                    IconButtonType(
                                            iconsSize: 50, iconImage: 'twitter')
                                        .iconButton(),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: RichText(
                                      text: TextSpan(children: [
                                    const TextSpan(
                                        text: 'Already have an account?',
                                        style:
                                            TextStyle(color: Colors.black45)),
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: ((context) {
                                                return const SignInPage();
                                              }),
                                            ),
                                          );
                                        },
                                      text: ' Log in',
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 62, 203, 192)),
                                    ),
                                  ])),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
