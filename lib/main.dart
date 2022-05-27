import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var questions = [
    {
      "questionText": "What's your favourite color?",
      "answers": ["Red", "Green", "Blue", "Orange", "Black", "White"]
    },
    {
      "questionText": "What's your favourite animal?",
      "answers": ["Dog", "Cat", "Rabbit", "Tiger", "Lion"]
    },
    {
      "questionText": "Which political party do you support?",
      "answers": ["PTI", "PMLN", "MQM", "PPP", "JUI"]
    },
    {
      "questionText": "What is your salary in Rs?",
      "answers": ["0", "<50k", "<150k", "<300k", ">300k"]
    },
    {
      "questionText": "Are you male or female?",
      "answers": ["Male", "Female"]
    },
    {
      "questionText": "What is your GPA?",
      "answers": ["0", "<1.0", "<2.0", "<3.0", ">3.0"]
    },
  ];
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("IQ Estimation Quiz"),
        ),
        body: _questionIndex < questions.length
            ? Column(children: [
                Question(questions[_questionIndex]["questionText"] as String),
                ...(questions[_questionIndex]["answers"] as List<String>)
                    .map((answer) {
                  return Answer(_answerQuestion, answer);
                }).toList()
              ])
            : Center(
                child: Text("Quiz completed!"),
              ),
      ),
    );
  }
}
