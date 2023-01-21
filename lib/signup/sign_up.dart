// ignore_for_file: unused_field, unused_element, no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ghost_talks/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ghost_talks/chat/call_screen.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GoogleSignInAccount? _currentUser;
  String _contactText = '';
  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact(_currentUser!);
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = 'Loading contact info...';
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = 'People API gave a ${response.statusCode} '
            'response. Check logs for details.';
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    final String? namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = 'I see you know $namedContact!';
      } else {
        _contactText = 'No contacts to display.';
      }
    });
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => (contact as Map<Object?, dynamic>)['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (contact != null) {
      final List<dynamic> names = contact['names'] as List<dynamic>;
      final Map<String, dynamic>? name = names.firstWhere(
        (dynamic name) =>
            (name as Map<Object?, dynamic>)['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>?;
      if (name != null) {
        return name['displayName'] as String?;
      }
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();
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
                            const CheckBoxListTile(
                              text: Text(
                                "I accept the terms and conditions  of GhostTalks",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            ButtomButton(
                              elevatedbutton: (() {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  // Send data to the server
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
                                _googleSignInIcon(),
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

Widget _googleSignInIcon() {
  GoogleSignInAccount? _currentUser;
  final GoogleSignInAccount? user = _currentUser;
  Function()? _handleSignIn;
  if (user != null) {
    String? _contactText;
    Function()? _handleSignOut;

    Function(GoogleSignInAccount user)? _handleGetContact;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ListTile(
          leading: GoogleUserCircleAvatar(
            identity: user,
          ),
          title: Text(user.displayName ?? ''),
          subtitle: Text(user.email),
        ),
        const Text('Signed in successfully.'),
        Text(_contactText.toString()),
        ElevatedButton(
          onPressed: _handleSignOut,
          child: const Text('SIGN OUT'),
        ),
        ElevatedButton(
          child: const Text('REFRESH'),
          onPressed: () => _handleGetContact!(user),
        ),
      ],
    );
  } else {
    return IconButton(
      iconSize: 70,
      onPressed: _handleSignIn,
      icon: Image.asset('images/google.png'),
    );
  }
}
