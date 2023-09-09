import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.itemData});
  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final bool isCorrectAnswer =
        itemData['userChosenAnswer'] == itemData['correctAnswer'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            questionIndex: itemData['questionIndex'] as int,
            isCorrectAnswer: isCorrectAnswer,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Your answer: ${itemData['userChosenAnswer']}',
                  style: GoogleFonts.lato(
                    color: isCorrectAnswer ? Colors.green : Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Correct answer: ${itemData['correctAnswer']}',
                  style: GoogleFonts.lato(
                    color: Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
