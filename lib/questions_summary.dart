import 'package:a1_quiz_app/models/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data['is_correct'] as bool
                            ? Colors.green
                            : Colors.pink.shade500,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        style: GoogleFonts.notoSansThai(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        ((data['question_index'] as int) + 1).toString(),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            style: GoogleFonts.notoSansThai(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            (data['question'] as QuizQuestion).text,
                          ),
                          const SizedBox(height: 5),
                          Text(
                              style: GoogleFonts.notoSansThai(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent,
                              ),
                              data['correct_answer'] as String),
                          Text(
                              style: GoogleFonts.notoSansThai(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlueAccent,
                              ),
                              data['user_answer'] as String),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
