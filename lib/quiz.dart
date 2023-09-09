import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

final random = Random();

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //? another way to initialize activeScreen
  /* Widget? activeScreen;
  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(changeScreen);
  } 

  void changeScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  } */

  //? better way to initialize activeScreen
  var activeScreen = 'startScreen';

  void changeScreen() {
    setState(() {
      activeScreen = 'questionsScreen';
    });
  }

  List<String> selectedAnswers = [];

  void storeSelectedAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'resultsScreen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'startScreen'; //? questionScreen in video
      selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget screenWidget = activeScreen == 'startScreen'
        ? StartScreen(changeScreen)
        : activeScreen == 'questionsScreen'
            ? QuestionsScreen(
                onSelectAnswerStore: storeSelectedAnswer,
              )
            : ResultsScreen(
                chosenAnswers: selectedAnswers,
                onRestart: restartQuiz,
              );

    //? another way to initialize screenWidget
    /*if (activeScreen == 'questionsScreen') {
      screenWidget = const QuestionsScreen();
    }
    else if (activeScreen == 'resultsScreen') {
      screenWidget = const ResultsScreen();
    }*/

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: boxDecorationOfContainer(), child: screenWidget),
        //? another way to initialize screenWidget
        /*activeScreen == 'startScreen'
        ? StartScreen(changeScreen)
        : const QuestionsScreen(); */
      ),
    );
  }
}

BoxDecoration boxDecorationOfContainer() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(
            random.nextInt(255), random.nextInt(255), random.nextInt(255), 1),
        Color.fromRGBO(
            random.nextInt(255), random.nextInt(255), random.nextInt(255), 1)
      ],
    ),
  );
}
