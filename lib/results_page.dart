import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_list.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/questions_blueprint/questions_blueprint.dart';

class ResultsPage extends StatefulWidget {
  final List<String> results;
  ResultsPage({super.key, required this.results});

  @override
  _DisplayResultsPage createState() => _DisplayResultsPage();
}

class _DisplayResultsPage extends State<ResultsPage> {
  @override
  Widget build(context) {
    // Creating the list in which we will store the question and the answer given by user and all this will be in form of Map
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < widget.results.length; i++) {
      summary.add({
        "question": questions[i].question,
        "correctAnswer": questions[i].answersList,
        "userAnswer": widget.results[i]
      });
    }
    var summaryLength = summary.length;

    return Container(
        height: 100,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 67, 2, 78),
            Color.fromARGB(255, 3, 9, 94)
          ]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                     ...summary.map((data) {
  String question = data['question'].toString();
  String correctAnswer = data['correctAnswer'].toString();
  return Column(
    children: [
      Text(question),
      Text(correctAnswer),
    ],
  );
  // return Text("Question: $question, Correct Answer: $correctAnswer");
}).toList(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
