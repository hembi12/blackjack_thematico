import 'card_model.dart';

class PlayerModel {
  final String name; // Nombre del jugador
  final List<CardModel> hand; // Cartas en la mano del jugador

  PlayerModel({
    required this.name,
    this.hand = const [],
  });

  // Calcula el puntaje total de las cartas en la mano
  int get score => hand.fold(0, (sum, card) => sum + card.value);

  // Agrega una carta a la mano
  void addCard(CardModel card) {
    hand.add(card);
  }

  // Reinicia la mano del jugador
  void resetHand() {
    hand.clear();
  }
}
