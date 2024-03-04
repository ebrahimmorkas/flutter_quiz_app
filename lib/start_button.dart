import "package:flutter/material.dart";
import "package:quiz_app/questions.dart";

class StartButton extends StatefulWidget {
  @override
  _StartButtonWidget createState() => _StartButtonWidget();
}

class _StartButtonWidget extends State<StartButton> {
  start_quiz() {
    // print("Button Clicked");
    Questions();
  }
  void startQuiz(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Questions()),
    );
  }
  @override
  Widget build(context) {
    return ElevatedButton(onPressed: () => startQuiz(context), child: const Text("Start Quiz"));
  }
}