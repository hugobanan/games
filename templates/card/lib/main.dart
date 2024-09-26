import 'package:flutter/material.dart';

void main() {
  runApp(ScrabbleApp());
}

class ScrabbleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrabble',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrabbleBoard(),
    );
  }
}

class ScrabbleBoard extends StatelessWidget {
  final int boardSize = 15;

  // Funkce pro vytváření jednoho políčka
  Widget buildTile(BuildContext context, int x, int y) {
    return Container(
      margin: EdgeInsets.all(2),
      width: 30,
      height: 30,
      color: Colors.grey[300],
      child: Center(
        child: Text(''), // Sem bude možné přidat písmeno
      ),
    );
  }

  // Funkce pro vytváření řádků desky
  List<Widget> buildRow(BuildContext context, int y) {
    return List.generate(boardSize, (x) => buildTile(context, x, y));
  }

  // Funkce pro vytváření celé desky
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrabble Board'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Column(
                children: List.generate(boardSize, (y) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildRow(context, y),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
