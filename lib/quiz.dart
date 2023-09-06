import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    final Widget screenWidget = activeScreen == 'startScreen'
        ? StartScreen(changeScreen)
        : const QuestionsScreen();

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: boxDecorationOfContainer(),
            child:
                screenWidget), /*activeScreen == 'startScreen'
        ? StartScreen(changeScreen)
        : const QuestionsScreen(); */
      ),
    );
  }
}

BoxDecoration boxDecorationOfContainer() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.blue, Colors.red],
    ),
  );
}
