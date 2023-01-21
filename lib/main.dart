import 'package:flutter/material.dart';
import 'package:ghost_talks/welcome/screen0.dart';
import 'chat/chat_screen.dart';

void main() {
  runApp(
    const HomePage(),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen0(),
    );
  }
}
