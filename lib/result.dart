import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int iqScore;
  final Function resetQuiz;
  Result(this.iqScore, this.resetQuiz);

  String get ResultPhase {
    var resultText = "Quiz completed";
    if (iqScore < 80) {
      resultText =
          "You are of below average intelligence, like 20% of the population";
    } else if (iqScore > 80 && iqScore < 110) {
      resultText =
          "You are of average intelligence, like 50% of the population";
    } else if (iqScore > 110 && iqScore < 130) {
      resultText =
          "You are gifted in terms of intelligence, like 6% of the population";
    } else {
      resultText =
          "You are very gifted in terms of intelligence, like 2% of the population";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 250,
        child: Column(
          children: [
            Text(
              "IQ : " + " ${iqScore}\n" + ResultPhase,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  primary: Colors.blue, side: BorderSide(color: Colors.blue)),
              onPressed: resetQuiz,
              child: Text("Restart Quiz"),
            )
          ],
        ),
      ),
    );
  }
}
