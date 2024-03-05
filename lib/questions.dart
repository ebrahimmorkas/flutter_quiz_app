// File that will display the questions on screen
import "package:flutter/material.dart";
import "package:quiz_app/questions_blueprint/questions_blueprint.dart";
import 'package:quiz_app/data/questions_list.dart';
import 'package:quiz_app/results_page.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsList createState() => _QuestionsList();
}

class _QuestionsList extends State<Questions> {
  var index = 0;
  List<String> userAnswers = [];
  QuestionsBlueprint question = questions[0];
  void answerClicked(buttonText) {
    // print(buttonText);
    userAnswers.add(buttonText);
    if(index != questions.length-1)
    {
    setState(() {
      index++;
      question = questions[index];
    });
    // print(question.question);
    }
    else {
      // print("Index out of range");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultsPage(results:userAnswers))
      );
    }
  }
  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple],
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Text(question.question),
            ...question.shuffleElements().map((answer) {
              return TextButton(
                onPressed: () => answerClicked(answer),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  foregroundColor: Colors.white,
                ),
                child: Text(answer),
                );
            }).toList(),
            
          ],
        ),
      ),
    );
  }
}