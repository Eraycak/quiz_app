import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswerStore,
  });

  final void Function(String answer) onSelectAnswerStore;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void changeToNextQuestion(String selectedAnswer) {
    widget.onSelectAnswerStore(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledList().map(
              (answer) {
                return Container(
                  margin: const EdgeInsets.only(
                      bottom: 10), //? This is self added. Not shown in video
                  child: AnswerButton(
                      answerText: answer,
                      onPressed: () {
                        changeToNextQuestion(answer);
                      }),
                );
                /* //! This is shown in video but no creates space between buttons as shown in video
                return AnswerButton(
                    answerText: answer,
                    onPressed: () {
                      changeToNextQuestion(answer);
                    });*/
              }, //* map is like foreach but for lists.
              //* Also, ... gets rid of the list brackets
              //* and gets individual elements from list
            ),
          ],
        ),
      ),
    );
  }
}
