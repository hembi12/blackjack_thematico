import 'package:flutter/material.dart';

class ChipsDisplay extends StatelessWidget {
  final int playerChips;

  const ChipsDisplay({required this.playerChips, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Fichas: $playerChips",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.yellow),
    );
  }
}
