// File that will display the questions oo screen
import "package:flutter/material.dart";
import "package:quiz_app/questions_blueprint/questions_blueprint.dart";
import 'package:quiz_app/data/questions_list.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsList createState() => _QuestionsList();
}

class _QuestionsList extends State<Questions> {
  void incrementIndex() {

  }
  Widget build(context) {
    QuestionsBlueprint question = questions[1];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple],
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Text(question.question),
          ],
        ),
      ),
    );
  }
}