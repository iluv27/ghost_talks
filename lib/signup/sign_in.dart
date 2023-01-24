// ignore_for_file: unused_field, unused_element, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ghost_talks/constants.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          //Background image
          decoration: decorationProperty(3),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 170.0, left: 40),
                    child: Text(
                      'Welcome Back',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
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
                                innerText: 'Enter Email',
                                validatorText: 'Please enter your email',
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              const InputField(
                                innerText: 'Enter Password',
                                validatorText: 'Please enter your password',
                              ),
                              const CheckBoxListTile(
                                text: Text(
                                  "Remember me",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ButtomButton(
                                elevatedbutton: (() {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    // Send data to the server
                                  }
                                }),
                                buttonText: 'Log in',
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
                                  'Log in with:',
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
                                          iconsSize: 40, iconImage: 'facebook')
                                      .iconButton(),
                                  IconButtonType(
                                          iconsSize: 60, iconImage: 'google')
                                      .iconButton(),
                                  IconButtonType(
                                          iconsSize: 40, iconImage: 'twitter')
                                      .iconButton(),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Center(
                                  child: RichText(
                                      text: TextSpan(children: [
                                    const TextSpan(
                                        text: 'Don\'t have an account?',
                                        style:
                                            TextStyle(color: Colors.black45)),
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pop(context);
                                        },
                                      text: ' Sign up',
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 62, 203, 192)),
                                    ),
                                  ])),
                                ),
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
    );
  }
}
