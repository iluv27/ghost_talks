// ignore_for_file: sized_box_for_whitespace, must_be_immutable, prefer_typing_uninitialized_variables, avoid_print
import 'package:flutter/material.dart';
import 'package:ghost_talks/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TextBlob extends StatelessWidget {
  TextBlob({super.key});

  // ignore: unused_field
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  TextEditingController message = TextEditingController();
  var loggedInUser;

  dynamic getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        return loggedInUser.email;
      }
    } catch (e) {
      print(e);
    }
  }

  void messagesStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var text in snapshot.docs) {
        print(text.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: decorationProperty(4),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                child: SizedBox(
                  height: 100,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 5.0, right: 20),
                      child: ListTile(
                        horizontalTitleGap: 0,
                        contentPadding: const EdgeInsets.all(0),
                        leading: CircleAvatar(
                          maxRadius: 45,
                          backgroundColor: Colors.blueGrey,
                          child: Text(
                            'PO',
                            style: kTextStyle(),
                          ),
                        ),
                        title: const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Mr Peter',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        subtitle: Row(
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 5,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Online',
                              style: TextStyle(color: Colors.white54),
                            ),
                          ],
                        ),
                        trailing: Material(
                          color: Colors.transparent,
                          child: Ink(
                            decoration: const ShapeDecoration(
                              shape: CircleBorder(),
                              color: Color(0XFF455A64),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.door_back_door_outlined),
                              iconSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
              Positioned(
                top: 85,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.88,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 30, right: 20),
                    child: Stack(children: [
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                height: null,
                                width: 250,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 215, 249, 247),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0),
                                  ),
                                ),
                                child: const Expanded(
                                  child: Text(
                                    'Where are you? I have been looking for you for several days.',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 48, 48, 48)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                height: null,
                                width: 250,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 236, 241, 239),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0),
                                  ),
                                ),
                                child: const Expanded(
                                  child: Text(
                                    'I was in a pitch of sorts!',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 48, 48, 48)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      //Message: Text Box to Type The Message
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 20,
                        child: Container(
                          height: 70,
                          child: TextField(
                            controller: message,
                            onChanged: ((value) {
                              value = message.text;
                            }),
                            decoration: InputDecoration(
                              prefixIcon: Material(
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 12),
                                  child: Ink(
                                    padding: const EdgeInsets.all(3.5),
                                    decoration: const ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(60, 60)),
                                      ),
                                      color: Color(0XFF455A64),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.mic),
                                      iconSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ), // Leading icon
                              suffixIcon: Material(
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 10),
                                  child: Ink(
                                    padding: const EdgeInsets.all(3.5),
                                    decoration: const ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(60, 60)),
                                      ),
                                      color: Color.fromARGB(57, 69, 90, 100),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        messagesStream();
                                        _firestore.collection('messages').add({
                                          'text': message.text,
                                          'sender': getCurrentUser()
                                        });
                                      },
                                      icon: const Icon(Icons.send),
                                      iconSize: 20,
                                      color: const Color(0XFF455A64),
                                    ),
                                  ),
                                ),
                              ), // Trailing icon
                              hintText: 'Message...', // Placeholder text
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(60, 60)),
                                borderSide: BorderSide(
                                  color: Color(0xff263238),
                                  width: 2,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(60, 60)),
                                borderSide: BorderSide(
                                  color: Color(0xff263238),
                                  width: 2,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(60, 60)),
                                borderSide: BorderSide(
                                  color: Color(0xff263238),
                                  width: 2,
                                ),
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(23, 69, 90, 100),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
