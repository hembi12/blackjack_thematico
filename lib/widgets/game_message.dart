import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class GameMessage extends StatelessWidget {
  final String message;

  const GameMessage({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    if (message.isEmpty) return SizedBox.shrink();
    return Center(
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            message,
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
            ),
            speed: Duration(milliseconds: 100),
          ),
        ],
        isRepeatingAnimation: false,
      ),
    );
  }
}
