import 'dart:js';

import 'package:quizzler/quizz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int _questionIndex = 0;
  List<Quizz> _quizz = [
    Quizz("qst1", false),
    Quizz("qst2", true),
    Quizz("qst3", false)
  ];

  String getQuestionText() {
    return _quizz[_questionIndex].question;
  }

  bool getQuestionAnswer() {
    return _quizz[_questionIndex].answer;
  }

  int getQuestionIndex() {
    return _questionIndex;
  }

  void incrementQuestionIndex() {
    if (_questionIndex < _quizz.length ) {
      _questionIndex++;
      print(_questionIndex);
    }

    if(_questionIndex == _quizz.length - 1){
      Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();
    }
  }

  int getQuizLength(){
    return _quizz.length;
  }

  
}
