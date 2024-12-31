import 'package:flutter/material.dart';
import '../models/card_model.dart';
import '../widgets/dealer_hand.dart';
import '../widgets/player_hand.dart';
import '../widgets/action_buttons.dart';
import '../widgets/game_message.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<CardModel> deck = [];
  List<CardModel> playerHand = [];
  List<CardModel> dealerHand = [];
  String gameMessage = "";

  @override
  void initState() {
    super.initState();
    initializeDeck();
    startGame();
  }

  void initializeDeck() {
    deck = [
      CardModel("💎", 1),
      CardModel("🍒", 2),
      CardModel("🔥", 3),
      CardModel("🍀", 4),
      CardModel("🎁", 5),
      CardModel("🍉", 6),
      CardModel("🔔", 7),
      CardModel("🎱", 8),
      CardModel("🦁", 9),
      CardModel("🐐", 10),
      CardModel("👑", 1, 11),
    ];
  }

  void startGame() {
    setState(() {
      initializeDeck();
      deck.shuffle();
      playerHand = [deck.removeLast(), deck.removeLast()];
      dealerHand = [deck.removeLast(), deck.removeLast()];
      gameMessage = "";
    });
  }

  int calculateScore(List<CardModel> hand) {
    int score = 0;

    for (var card in hand) {
      if (card.alternateValue != null && score + card.alternateValue! <= 21) {
        score += card.alternateValue!;
      } else {
        score += card.value;
      }
    }

    return score;
  }

  void hit() {
    setState(() {
      playerHand.add(deck.removeLast());
      int playerScore = calculateScore(playerHand);
      if (playerScore > 21) {
        gameMessage = "💥 ¡Te pasaste! El crupier gana.";
      }
    });
  }

  void stand() {
    setState(() {
      while (calculateScore(dealerHand) < 17) {
        dealerHand.add(deck.removeLast());
      }
      int playerScore = calculateScore(playerHand);
      int dealerScore = calculateScore(dealerHand);

      if (dealerScore > 21 || playerScore > dealerScore) {
        gameMessage = "🎉 ¡Ganaste!";
      } else if (playerScore < dealerScore) {
        gameMessage = "💔 Perdiste. El crupier gana.";
      } else {
        gameMessage = "🤝 Es un empate.";
      }
    });
  }

  Future<bool> _showExitConfirmation() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Confirmar salida"),
            content: Text("¿Estás seguro de que quieres salir de la partida?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text("No"),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text("Sí"),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _showExitConfirmation, // Captura el botón de retroceso físico
      child: Scaffold(
        appBar: AppBar(
          title: Text("Blackjack Temático"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () async {
              bool shouldExit = await _showExitConfirmation();
              if (shouldExit) {
                Navigator.of(context).pop(); // Regresar a la pantalla anterior
              }
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green.shade900,
                Colors.green.shade800,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DealerHand(
                dealerHand: dealerHand,
                dealerScore: calculateScore(dealerHand),
              ),
              SizedBox(height: 20),
              PlayerHand(
                playerHand: playerHand,
                playerScore: calculateScore(playerHand),
              ),
              SizedBox(height: 20),
              GameMessage(message: gameMessage),
              SizedBox(height: 40),
              ActionButtons(
                onHit: hit,
                onStand: stand,
                onRestart: startGame,
                isGameActive: gameMessage.isEmpty,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
