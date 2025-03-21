import 'package:a1_quiz_app/widgets/answer_button.dart';
// import 'package:a1_quiz_app/models/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:a1_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
    required this.onSelectedAns,
  });

  final void Function(String ans) onSelectedAns;

  @override
  State<QuizPage> createState() {
    return _QuizPageState();
  }
}

class _QuizPageState extends State<QuizPage> {
  var currentQuestionIndex = 0;

  ansQuestion(String selectedAns) {
    widget.onSelectedAns(selectedAns);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    // Why do we put current Question inside build?

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.notoSansThai(color: Colors.white, fontSize: 30),
            // style: const TextStyle(color: Colors.white, fontSize: 30),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          // ...currentQuestion.getShuffleAns().map(
          ...currentQuestion.shuffleAns.map(
            (ans) {
              return AnswerButton(
                ansText: ans,
                selectHandler: () {
                  ansQuestion(ans);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
