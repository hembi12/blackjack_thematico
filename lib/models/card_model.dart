class CardModel {
  final String emoji; // Representa el emoji de la carta
  final int value; // Valor principal de la carta
  final int? alternateValue; // Valor alternativo opcional

  const CardModel(this.emoji, this.value, [this.alternateValue]);
}
