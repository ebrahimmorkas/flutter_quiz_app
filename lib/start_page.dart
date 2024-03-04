import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  void start_quiz() {}

  Widget build(context) {
    return Container(
          width: double.infinity,
          height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue, Colors.green])
      ),
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '../images/quiz-logo.png',
            width: 200,
            height: 300,
          ),
          const SizedBox(height:20),
          const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 50,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height:20),
          ElevatedButton(onPressed: start_quiz, child: const Text("Start Quiz"))
        ],
      ),
    ));
  }
}
