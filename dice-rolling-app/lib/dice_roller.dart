import 'dart:math';
import 'package:flutter/material.dart';
import 'styled_text.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key, required this.color1Default, required this.color2Default, required this.color1Lose, required this.color2Lose, required this.color1Win, required this.color2Win,});

  final Color color1Default;
  final Color color2Default;
  final Color color1Lose;
  final Color color2Lose;
  final Color color1Win;
  final Color color2Win;

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;
  static const int maxChances = 5;
  var currentScore = 0;
  var chances = maxChances;
  List<String> scoreBoard = List.filled(maxChances, '--');


  void rollDice() {
    setState(() {
      if (chances > 0) {
        currentDiceRoll = randomizer.nextInt(6) + 1;
        currentScore += currentDiceRoll;
        scoreBoard[maxChances - chances] = currentDiceRoll.toString();
        chances--;
      }

      else {
        // ulang lagi
        currentScore = 0;
        chances = maxChances;
        scoreBoard = List.filled(maxChances, '--');
      }
    });
  }

  @override
  Widget build(context) {
    final bool hasWon = currentScore >= 20;
    final bool hasLost = currentScore < 20 && chances == 0;

    return SizedBox.expand(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: hasWon ? [widget.color1Win, widget.color2Win] : hasLost ? [widget.color1Lose, widget.color2Lose] : [widget.color1Default, widget.color2Default],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasWon) StyledText('You Win 🍾')
            else if (hasLost) StyledText('You Lose 😿')
            else StyledText('Your Score'),

            Text(
              '$currentScore/20',
              style: const TextStyle(fontSize: 60, color: Colors.white),
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: 350,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value:  currentScore / 20,
                  backgroundColor: Colors.purple,
                  color: const Color.fromARGB(255, 229, 194, 239),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Table(
              defaultColumnWidth: const FixedColumnWidth(70),
              children: [
                const TableRow(
                  children: [
                    Center(child: StyledText('1st')),
                    Center(child: StyledText('2nd')),
                    Center(child: StyledText('3rd')),
                    Center(child: StyledText('4th')),
                    Center(child: StyledText('5th')),
                  ],
                ),
                TableRow(
                  children: scoreBoard.map(
                        (score) => SizedBox(
                      child: Center(
                        child: Text(
                          score,
                          style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20),

            chances < maxChances ? Image.asset(
              'assets/images/dice-$currentDiceRoll.png',
              width: 200, height: 200,
            ) : const SizedBox(width: 200, height: 200),


            const SizedBox(height: 35),
            TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
                textStyle: const TextStyle(fontSize: 28),
              ),
              child: chances == 0 ? StyledText('Play Again 🎮') : StyledText('Roll Dice 🎲'),
            ),
            const SizedBox(height: 15),
            if (chances > 0)
              Text(
                'Chances left: $chances',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}