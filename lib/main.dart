import 'package:flutter/material.dart';
import 'package:ghost_talks/welcome/screen0.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const WelcomeScreen0(),
    );
  }
}
