// ignore_for_file: avoid_unnecessary_containers, avoid_print, prefer_typing_uninitialized_variables, unused_element, unused_import, must_be_immutable, unused_field

import 'dart:ffi';
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

  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  int selectedIndex = 0;

  static List<Widget> pages = [
    const ChatScreen(),
    const CallScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: ((context, value, child) {
            return pages[value];
          })),
      bottomNavigationBar: _BottomBarItems(
        onItemSelected: (selectedIndex) {
          pageIndex.value = selectedIndex;
        },
      ),
    );
  }
}

class _BottomBarItems extends StatefulWidget {
  const _BottomBarItems({this.onItemSelected});

  final ValueChanged<int>? onItemSelected;

  @override
  State<_BottomBarItems> createState() => _BottomBarItemsState();
}

class _BottomBarItemsState extends State<_BottomBarItems> {
  int selIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selIndex = index;
    });

    widget.onItemSelected!(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Material(
        elevation: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: const BoxDecoration(
            color: Color(0XFF263238),
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomBarItem(
                selectedIndex: 0,
                icon: Icons.message,
                text: 'Chats',
                onTap: handleItemSelected,
                isSelected: selIndex == 0,
              ),
              BottomBarItem(
                selectedIndex: 1,
                icon: Icons.call,
                text: 'Calls',
                onTap: handleItemSelected,
                isSelected: selIndex == 1,
              ),
              BottomBarItem(
                selectedIndex: 2,
                icon: Icons.sports_esports,
                text: 'Games',
                onTap: handleItemSelected,
                isSelected: selIndex == 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  BottomBarItem(
      {super.key,
      required this.icon,
      required this.text,
      required this.selectedIndex,
      this.onTap,
      this.isSelected = false});

  ValueChanged<int>? onTap;
  int selectedIndex;
  String text;
  IconData icon;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (() {
        onTap!(selectedIndex);
      }),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0XFF46ECE2) : Colors.white,
            size: isSelected ? 30 : 28,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            text,
            style: TextStyle(
                color: isSelected ? const Color(0XFF46ECE2) : Colors.white,
                fontSize: 13),
          ),
        ],
      ),
    );
  }
}
