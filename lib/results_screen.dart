import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summaryData.add({
        'questionIndex': i,
        'question': questions[i].question,
        'userChosenAnswer': chosenAnswers[i],
        'correctAnswer': questions[i].answers[0],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summaryData = getSummaryData();
    final int numTotalQuestions = questions.length;
    final int numCorrectAnswers = summaryData
        .where((data) => data['userChosenAnswer'] == data['correctAnswer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(
              summaryData: summaryData,
            ),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(
                Icons.refresh_rounded,
                color: Colors.white,
              ),
              label: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
