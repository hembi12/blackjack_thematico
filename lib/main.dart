import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(BlackjackApp());
}

class BlackjackApp extends StatelessWidget {
  const BlackjackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blackjack Temático',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}
