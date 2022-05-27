import 'package:flutter/material.dart';
import './quiz.dart';
import './answer.dart';
import "./result.dart";

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
  var _questions = [
    {
      "questionText": "What's your favourite color?",
      "answers": [
        {"text": "Red", "score": 20},
        {"text": "Green", "score": 20},
        {"text": "Blue", "score": 15},
        {"text": "Orange", "score": 15},
        {"text": "Black", "score": 10},
        {"text": "White", "score": 10}
      ]
    },
    {
      "questionText": "What's your favourite animal?",
      "answers": [
        {"text": "Dog", "score": 20},
        {"text": "Cat", "score": 20},
        {"text": "Rabbit", "score": 15},
        {"text": "Tiger", "score": 15},
        {"text": "Lion", "score": 10}
      ]
    },
    {
      "questionText": "Which political party do you support?",
      "answers": [
        {"text": "PTI", "score": 25},
        {"text": "PMLN", "score": 20},
        {"text": "PPP", "score": 15},
        {"text": "MQM", "score": 5},
        {"text": "JUI", "score": 5}
      ]
    },
    {
      "questionText": "What is your salary in Rs?",
      "answers": [
        {"text": "0", "score": 5},
        {"text": "<50k", "score": 15},
        {"text": "<100k", "score": 20},
        {"text": "<200k", "score": 25},
        {"text": ">200k", "score": 30}
      ]
    },
    {
      "questionText": "Are you male or female?",
      "answers": [
        {"text": "Male", "score": 20},
        {"text": "Female", "score": 15}
      ]
    },
    {
      "questionText": "What is your GPA?",
      "answers": [
        {"text": "0", "score": 5},
        {"text": "<1.0", "score": 15},
        {"text": "<2.0", "score": 20},
        {"text": "<3.0", "score": 25},
        {"text": ">3.0", "score": 30}
      ]
    },
  ];
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
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
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
