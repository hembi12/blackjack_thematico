import 'package:flutter/material.dart';

class BetControls extends StatelessWidget {
  final int currentBet;
  final int playerChips;
  final VoidCallback onIncreaseBet;
  final VoidCallback onDecreaseBet;

  const BetControls({
    required this.currentBet,
    required this.playerChips,
    required this.onIncreaseBet,
    required this.onDecreaseBet,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: currentBet > 10 ? onDecreaseBet : null,
          icon: Icon(Icons.remove_circle, color: Colors.red),
        ),
        Text(
          "Apuesta: $currentBet fichas",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        IconButton(
          onPressed: currentBet < playerChips ? onIncreaseBet : null,
          icon: Icon(Icons.add_circle, color: Colors.green),
        ),
      ],
    );
  }
}
