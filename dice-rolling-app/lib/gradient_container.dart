import 'package:flutter/material.dart';

import 'dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1Default, this.color2Default, this.color1Lose, this.color2Lose, this.color1Win, this.color2Win, {super.key});

  //const GradientContainer.purple({super.key})
  //    : color1 = Colors.deepPurple,
  //      color2 = Colors.indigo;

  final Color color1Default;
  final Color color2Default;
  final Color color1Lose;
  final Color color2Lose;
  final Color color1Win;
  final Color color2Win;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1Default, color2Default],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        child: DiceRoller(
          color1Default: color1Default,
          color2Default: color2Default,
          color1Lose: color1Lose,
          color2Lose: color2Lose,
          color1Win: color1Win,
          color2Win: color2Win,
        ),
      ),
    );
  }
}
