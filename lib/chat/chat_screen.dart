// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, unused_import, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghost_talks/constants.dart';
import 'call_screen.dart';
import 'profile_screen.dart';
import 'text_box.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List items = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        maxRadius: 37,
        backgroundColor: const Color.fromARGB(255, 172, 172, 172),
        child: Text(
          '+',
          style: kTextStyle(),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        maxRadius: 37,
        backgroundColor: Colors.blueGrey,
        child: Text(
          'PO',
          style: kTextStyle(),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        maxRadius: 37,
        backgroundColor: Colors.green,
        child: Text(
          'HS',
          style: kTextStyle(),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        maxRadius: 37,
        backgroundColor: const Color.fromARGB(255, 151, 34, 34),
        child: Text(
          'AM',
          style: kTextStyle(),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        maxRadius: 37,
        backgroundColor: Colors.yellow,
        child: Text(
          'WN',
          style: kTextStyle(),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        maxRadius: 37,
        backgroundColor: Colors.blue,
        child: Text(
          'UX',
          style: kTextStyle(),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        maxRadius: 37,
        backgroundColor: Colors.purpleAccent,
        child: Text(
          'PO',
          style: kTextStyle(),
        ),
      ),
    ),
  ];

  List textBox = [
    const TextBox(),
    const TextBox(),
    const TextBox(),
    const TextBox(),
    const TextBox(),
    const TextBox(),
    const TextBox(),
  ];

  int? index;

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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 25),
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
                ),
                Positioned(
                  top: 95,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
                          const EdgeInsets.only(top: 25.0, left: 30, right: 20),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Chats',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87),
                                ),
                              ),
                              Container(
                                height: 90,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: items.length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Row(
                                        children: [items[index]],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.87,
                            padding: const EdgeInsets.only(top: 130),
                            child: Column(
                              children: [
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
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: textBox.length,
                                    itemBuilder: ((context, textIndex) {
                                      return textBox[textIndex];
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ))));
  }
}
