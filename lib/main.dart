import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int LeftDiceNumber = 1;
  int RightDiceNumber = 1;

  randomDice() {
    setState(() {
      LeftDiceNumber = Random().nextInt(6) + 1;
      RightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  resetRandomDice() {
    LeftDiceNumber = 1;
    RightDiceNumber = 1;
  }

  Dice(sideDice) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          setState(() {
            randomDice();
          });
          print('Left Button is clicked');
        },
        onLongPress: () {
          setState(() {
            resetRandomDice();
          });
        },
        child: Image.asset('images/dice$sideDice.png'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Dice(LeftDiceNumber),
          Dice(RightDiceNumber),
        ],
      ),
    );
  }
}
