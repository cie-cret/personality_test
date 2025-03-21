import 'package:a1_quiz_app/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:a1_quiz_app/widgets/questions_summary.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;

  // List<Map<String, Object>> getSummaryData() {
  //   final List<Map<String, Object>> summary = [];

  //   for (int i = 0; i < chosenAnswers.length; i++) {
  //     summary.add({
  //       'question_index': i,
  //       'question': questions[i],
  //       'correct_answer': questions[i].answers[0],
  //       'user_answer': chosenAnswers[i],
  //       'is_correct': chosenAnswers[i] == questions[i].answers[0],
  //     });
  //   }

  //   return summary;
  // }

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i],
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
        'is_correct': chosenAnswers[i] == questions[i].answers[0],
      });
    }

    return summary;
  }

  final void Function() onRestart;

  String getResultImage(double scorePercentage) {
    switch (scorePercentage) {
      case >= 0.8:
        return 'assets/images/mom.png';
      case >= 0.5:
        return 'assets/images/daughter.png';
      default:
        return 'assets/images/man.jpg';
    }
  }

  @override
  Widget build(context) {
    // final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctAnswers = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    final scorePercentage = correctAnswers / totalQuestions;
    final resultImage = getResultImage(scorePercentage);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Normal Version
          // Text(
          //   '$correctAnswers / $totalQuestions คะแนน',
          //   style: GoogleFonts.notoSansThai(
          //       color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          // ),
          // const SizedBox(height: 20),
          // QuestionsSummary(getSummaryData()),

          // Another Version
          Image.asset(
            resultImage,
            width: 250,
          ),
          const SizedBox(height: 20),
          Text(
            scorePercentage >= 0.8
                ? 'ไหว้แม่สิลูก'
                : scorePercentage >= 0.5
                    ? 'หวัดดีจ้ะลูกสาว'
                    : 'ชายแท้ครับจารย์',
            style: GoogleFonts.notoSansThai(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            scorePercentage >= 0.8
                ? 'แกมันตัวแม่ (แต่หน้าพ่อ)'
                : scorePercentage >= 0.5
                    ? 'ถ้ายังไม่เปิดตัว ก็เปิดซะนะ'
                    : 'คืนนี้ใจเกเร',
            style: GoogleFonts.notoSansThai(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: onRestart,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'ขออีกรอบ',
                  style: GoogleFonts.notoSansThai(),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.restart_alt_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
