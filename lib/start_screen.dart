import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            height: 200,
            color: const Color.fromARGB(150, 255, 255,
                255), //*alpha is changed to add some transparency
          ),
          const SizedBox(height: 60),
          const Text(
            'Start Screen',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.play_arrow_sharp),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
