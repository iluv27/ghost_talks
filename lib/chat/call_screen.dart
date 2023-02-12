// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
          onPressed: (() {
            Navigator.pop(context);
          }),
          icon: const Icon(
            Icons.call,
          )),
      body: Center(
          child: Container(
        child: const Text('Hi Calls'),
      )),
    );
  }
}
