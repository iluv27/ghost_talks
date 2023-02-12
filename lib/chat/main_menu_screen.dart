// ignore_for_file: avoid_unnecessary_containers, avoid_print, prefer_typing_uninitialized_variables, unused_element, unused_import

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghost_talks/constants.dart';
import 'call_screen.dart';
import 'profile_screen.dart';
import 'chat_screen.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  //Nav Bar Congig....
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
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

  int? index;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: ChatScreen(),
      bottomNavigationBar: _BottomBarItems(),
    );
  }
}

class _BottomBarItems extends StatelessWidget {
  const _BottomBarItems();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Container(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomBarItem(
              icon: Icons.call,
              label: 'calls',
            ),
            BottomBarItem(
              icon: Icons.message,
              label: 'chat',
            ),
            BottomBarItem(
              icon: Icons.person,
              label: 'profile',
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  BottomBarItem({super.key, this.icon, this.label});

  String? label;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      semanticLabel: label,
    );
  }
}

// Container(
//           decoration: const BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(30), topLeft: Radius.circular(60)),
//           ),
//           child: Material(
//             elevation: 0.0,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(60.0)),
//             child: BottomNavigationBar(
//               elevation: 0,
//               backgroundColor: Colors.transparent,
//               items: const <BottomNavigationBarItem>[
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.home),
//                   label: 'Home',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.favorite),
//                   label: 'Favorites',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.person),
//                   label: 'Profile',
//                 ),
//               ],
//             currentIndex: _selectedIndex,
//           selectedItemColor: Colors.amber[800],
//           onTap: _onItemTapped,
//         //   shape: RoundedRectangleBorder(
//         //   borderRadius: BorderRadius.circular(20),
//         // ),
//             ),
//           ),),