import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback handler;

  Result(this.resultScore, this.handler);

  String get resultPhrase {
    var resultText = 'you did it';
    if (resultScore >= 15) {
      resultText = 'awesome...';
    } else if (resultScore >= 12) {
      resultText = 'fine...';
    } else if (resultScore >= 10) {
      resultText = 'weird...';
    } else {
      resultText = 'bad...';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
            child: Text('Restart quiz'),
            style: OutlinedButton.styleFrom(
                primary: Colors.red, textStyle: TextStyle(color: Colors.white)),
            onPressed: handler,
          ),
        ],
      ),
    );
  }
}
