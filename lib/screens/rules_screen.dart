import 'package:flutter/material.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reglas del Juego'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reglas del Blackjack Temático',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '1. El objetivo del juego es obtener un puntaje lo más cercano posible a 21 sin excederlo.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                '2. Valores de las cartas:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),
              Table(
                border: TableBorder.all(color: Colors.white),
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.red[600]),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Carta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Valor', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
                      ),
                    ],
                  ),
                  ...[
                    {'emoji': '💎', 'value': '1'},
                    {'emoji': '🍒', 'value': '2'},
                    {'emoji': '🔥', 'value': '3'},
                    {'emoji': '🍀', 'value': '4'},
                    {'emoji': '🎁', 'value': '5'},
                    {'emoji': '🍉', 'value': '6'},
                    {'emoji': '🔔', 'value': '7'},
                    {'emoji': '🎱', 'value': '8'},
                    {'emoji': '🦁', 'value': '9'},
                    {'emoji': '🐐', 'value': '10'},
                    {'emoji': '👑', 'value': '1 o 11'},
                  ].map((card) {
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(card['emoji']!, style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(card['value']!, style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
              SizedBox(height: 10),
              Text(
                '3. Los jugadores comienzan con dos cartas y pueden pedir más para acercarse a 21.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                '4. Si el jugador supera los 21 puntos, pierde automáticamente.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                '5. El crupier debe pedir cartas hasta que tenga al menos 17 puntos.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                '6. Si el crupier supera los 21 puntos, el jugador gana automáticamente.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                '7. Si el puntaje del jugador y el crupier es igual, el juego termina en empate.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Consejos:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '- Observa las cartas visibles del crupier para tomar decisiones estratégicas.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                '- Usa el 👑 sabiamente para ajustarte a tu mejor puntaje.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 50), // Espacio añadido al final
            ],
          ),
        ),
      ),
    );
  }
}
