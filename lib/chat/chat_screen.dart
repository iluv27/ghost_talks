// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, unused_import, sized_box_for_whitespace

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghost_talks/constants.dart';
import 'call_screen.dart';
import 'profile_screen.dart';
import 'text_box.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List items = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CircleAvatar(
        maxRadius: 40,
        backgroundColor: const Color.fromARGB(255, 172, 172, 172),
        child: Text(
          '+',
          style: kTextStyle(),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CircleAvatar(
        maxRadius: 40,
        backgroundColor: Colors.blueGrey,
        child: Text(
          'PO',
          style: kTextStyle(),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CircleAvatar(
        maxRadius: 40,
        backgroundColor: Colors.green,
        child: Text(
          'HS',
          style: kTextStyle(),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CircleAvatar(
        maxRadius: 40,
        backgroundColor: const Color.fromARGB(255, 151, 34, 34),
        child: Text(
          'AM',
          style: kTextStyle(),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CircleAvatar(
        maxRadius: 40,
        backgroundColor: Colors.yellow,
        child: Text(
          'WN',
          style: kTextStyle(),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CircleAvatar(
        maxRadius: 40,
        backgroundColor: Colors.blue,
        child: Text(
          'UX',
          style: kTextStyle(),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CircleAvatar(
        maxRadius: 40,
        backgroundColor: Colors.purpleAccent,
        child: Text(
          'PO',
          style: kTextStyle(),
        ),
      ),
    ),
  ];

  int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: decorationProperty(4),
            child: SafeArea(
                child: Wrap(children: [
              SizedBox(
                height: 750,
                child: SingleChildScrollView(
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Welcome Bola',
                                  style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'It\'s good to see you again!',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Ink(
                                decoration: const ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: Color(0XFF455A64),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.notifications),
                                  iconSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0, left: 30, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Chats',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87),
                                ),
                                Container(
                                  height: 100,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: items.length,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          children: [items[index]],
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Recent Chat',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black87),
                                    ),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.symmetric(
                                                  vertical: 10,
                                                  horizontal: 20)),
                                          elevation:
                                              const MaterialStatePropertyAll(0),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color.fromARGB(
                                                      255, 184, 237, 234)),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                        onPressed: (() {}),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.archive,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Archived Chat',
                                              style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const TextBox(),
                                const TextBox(),
                                const TextBox(),
                                const TextBox(),
                                const TextBox(),
                                const TextBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]))));
  }
}
