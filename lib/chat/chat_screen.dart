// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghost_talks/constants.dart';
import 'call_screen.dart';
import 'profile_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //Nav Bar Congig....
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    const ChatScreen(),
    const CallScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //Firebase Config...
  final _auth = FirebaseAuth.instance;

  var loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

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
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Welcome Bola',
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'It\'s good to see you again!',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Material(
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
                    padding:
                        const EdgeInsets.only(top: 30.0, left: 30, right: 20),
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
                                padding: const EdgeInsets.only(top: 15.0),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          vertical: 10, horizontal: 20)),
                                  elevation: const MaterialStatePropertyAll(0),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(255, 184, 237, 234)),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
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
                                          color: Colors.black38, fontSize: 10),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 90,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0XFFDFE8E7), width: 0.8),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                              title: Row(
                                children: const [
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 5,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Peter Obi',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              subtitle: const Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Hello dear! Whatssup??',
                                  style: TextStyle(color: Colors.black38),
                                ),
                              ),
                              trailing: const Text(
                                '22:00',
                                style: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: Material(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          )),
    );
  }
}
