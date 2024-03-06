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
        "correctAnswer": questions[i].answersList[0],
        "userAnswer": widget.results[i]
      });
    }

    List correctAnswers = summary.where((element) => element['correctAnswer'] == element['userAnswer']).toList();

    // Creating the variables that will contain the total number of right answers given by user and total questions
    var totalNumberOfCorrectAnswer = correctAnswers.length;
    var totalNumberOfQuestions = summary.length;

    Text styleTextWidget(text) {
      var textColor = Colors.white54;
      if (correctAnswers.contains(text))
      {
        textColor = Colors.white70;
      }
      return Text(
        text,
        style: const TextStyle(
          color: Colors.white54,
          fontSize: 35,
          fontFamily: AutofillHints.creditCardNumber,
        )
      );
    }

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
              Container(
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'You got $totalNumberOfCorrectAnswer right answers out of $totalNumberOfQuestions questions',
                          style: const TextStyle(
                            fontFamily: AutofillHints.fullStreetAddress,
                            fontSize: 35,
                            color: Colors.white38,
                          ),
                          ),
                        const SizedBox(height: 30),
                        ...summary.map((data) {
                          String question = data['question'].toString();
                          String correctAnswer =
                              data['correctAnswer'].toString();
                              String userAnswer = data['userAnswer'].toString();
                          return Column(
                            children: [
                              styleTextWidget(question),
                              styleTextWidget(correctAnswer),
                              styleTextWidget(userAnswer),
                              const SizedBox(height: 80),
                            ],
                          );
                          // return Text("Question: $question, Correct Answer: $correctAnswer");
                        }).toList(),
                      ],
                    ),
                  )
                  ),
            ],
          ),
        )
        );
  }
}
