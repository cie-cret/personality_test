import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  // const HomePage(this.text, {super.key});
  const HomePage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: Colors.white54,
          ),
          const SizedBox(height: 75),
          Text(
            // 'Learn Flutter The Fun Way!',
            'ทดสอบจริตในตัวคุณ',
            style: GoogleFonts.notoSansThai(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),

          OutlinedButton(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Text('Start Quiz'),
                Text(
                  'เริ่มเลอ',
                  style: GoogleFonts.notoSansThai(),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.arrow_right_alt),
              ],
            ),
          ),

          // OutlinedButton.icon(
          //   onPressed: startQuiz,
          //   style: OutlinedButton.styleFrom(
          //     foregroundColor: Colors.white,
          //   ),
          //   icon: const Icon(Icons.arrow_right_alt),
          //   label: const Text(
          //     'Start Quiz',
          //     // style: TextStyle(color: Colors.white),
          //   ),
          // )
        ],
      ),
    );
  }
}
