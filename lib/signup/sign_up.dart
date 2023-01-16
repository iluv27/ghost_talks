import 'package:flutter/material.dart';
import 'package:ghost_talks/constants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 50),
                    child: Column(
                      children: [
                        TextFormField(
                          cursorWidth: 1.5,
                          cursorHeight: 20,
                          cursorColor: Color.fromARGB(255, 36, 128, 121),
                          style: const TextStyle(color: Colors.black87),
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            floatingLabelStyle: const TextStyle(
                              color: Colors.black87,
                            ),
                            hintText: 'Enter Full Name',
                            hintStyle: const TextStyle(color: Colors.black26),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black26,
                                  style: BorderStyle.solid,
                                  width: 1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black26,
                                  style: BorderStyle.solid,
                                  width: 1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
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
