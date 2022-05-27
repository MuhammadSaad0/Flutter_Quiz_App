import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function ansQ;
  final String answerText;
  Answer(this.ansQ, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(answerText),
        onPressed: ansQ,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue)),
      ),
    );
  }
}
