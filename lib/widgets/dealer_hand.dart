import 'package:flutter/material.dart';
import '../models/card_model.dart';

class DealerHand extends StatelessWidget {
  final List<CardModel> dealerHand;
  final int dealerScore;

  const DealerHand({
    super.key,
    required this.dealerHand,
    required this.dealerScore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                "Mano del crupier:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: dealerHand
                      .map((card) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 3,
                                    offset: Offset(1, 2),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                card.emoji,
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Puntos del crupier: $dealerScore",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
