import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onHit;
  final VoidCallback onStand;
  final VoidCallback onRestart;
  final bool isGameActive;

  const ActionButtons({
    required this.onHit,
    required this.onStand,
    required this.onRestart,
    required this.isGameActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: isGameActive ? onHit : null,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.red,
            shadowColor: Colors.black,
            elevation: 10,
          ),
          child: Icon(
            Icons.add_circle,
            color: Colors.white,
            size: 30,
          ),
        ),
        ElevatedButton(
          onPressed: isGameActive ? onStand : null,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.white,
            shadowColor: Colors.black,
            elevation: 10,
          ),
          child: Icon(
            Icons.horizontal_rule,
            color: Colors.black,
            size: 30,
          ),
        ),
        ElevatedButton(
          onPressed: onRestart,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.blue,
            shadowColor: Colors.black,
            elevation: 10,
          ),
          child: Icon(
            Icons.restart_alt,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
