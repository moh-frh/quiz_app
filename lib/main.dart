// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:quizzler/quizz.dart';

QuizBrain quiz_brain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool answer){
    setState(() {
      if (quiz_brain.getQuestionIndex() <
          quiz_brain.getQuizLength() - 1) {
        if (quiz_brain.getQuestionAnswer() == answer) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.teal,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
      }

      quiz_brain.incrementQuestionIndex();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  quiz_brain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: FlatButton(
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                "True",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.teal,
            ),
          )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: FlatButton(
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text(
                  "False",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),
            ),
          ),
          Row(children: scoreKeeper)
        ]);
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
