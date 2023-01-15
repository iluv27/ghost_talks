import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bgcolor3.png'), fit: BoxFit.cover),
          ),
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
                    child: Column(
                      children: [
                        FormItems(
                          obscureTextInput: false,
                          hintText: 'Enter Your Mail',
                          labelText: 'Email',
                          suffixIcon: Icon(Icons.mail),
                          validatorText: 'Please enter your mail',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormItems(
                          obscureTextInput: true,
                          hintText: 'Enter Your Password',
                          labelText: 'Password',
                          suffixIcon: Icon(Icons.key),
                          validatorText: 'Please enter your password',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Checkbox(value: false, onChanged: ((value) {})),
                            Text('Remember me')
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0XFF242F9B)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 30)),
                              ),
                              child: const Text('Log In'),
                              onPressed: () {
                                // ignore: unused_local_variable
                                final snackBar = SnackBar(
                                  content: const Text('Yay! A SnackBar!'),
                                );

                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('Data is in processing.')));
                                }
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class FormItems extends StatelessWidget {
  const FormItems(
      {Key? key,
      this.hintText,
      this.labelText,
      this.suffixIcon,
      required this.obscureTextInput,
      required this.validatorText})
      : super(key: key);

  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final String validatorText;
  final bool obscureTextInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureTextInput,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 10),
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validatorText;
        }
        return null;
      },
    );
  }
}
