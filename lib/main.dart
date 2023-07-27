import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalscore = 0;

  final questions = const [
    {
      'questionText': 'what\'s your favourite color?',
      'answers': [
        {'text': 'blue', 'score': 5},
        {'text': 'black', 'score': 4},
        {'text': 'red', 'score': 3},
        {'text': 'yellow', 'score': 2}
      ]
    },
    {
      'questionText': 'what\'s your favourite series?',
      'answers': [
        {'text': 'grey\'s anatomy', 'score': 2},
        {'text': 'castle', 'score': 1},
        {'text': 'friends', 'score': 5},
        {'text': 'big bang theory', 'score': 0}
      ]
    },
    {
      'questionText': 'what\'s your favourite animal?',
      'answers': [
        {'text': 'elephant', 'score': 5},
        {'text': 'lion', 'score': 5},
        {'text': 'cat', 'score': 5},
        {'text': 'dog', 'score': 5}
      ]
    }
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < questions.length) {
      print('We have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('PERSONALITY TEST!!!'),
      ),
      body: _questionIndex < questions.length
          ? Quiz(
              questionIndex: _questionIndex,
              answerQuestion: _answerQuestion,
              questions: questions,
            )
          : Result(_totalscore, _resetQuiz),
    ));
  }
}
