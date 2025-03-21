import 'package:a1_quiz_app/data/questions.dart';
import 'package:a1_quiz_app/widgets/home_page.dart';
import 'package:a1_quiz_app/widgets/quiz_page.dart';
import 'package:a1_quiz_app/widgets/result_page.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activePage;

  // @override
  // void initState() {
  //   activePage = HomePage(switchPage);
  //   super.initState();
  // }
  List<String> selectedAns = [];
  var activePage = 'home-page';

  void chosenAns(String ans) {
    selectedAns.add(ans);

    if (selectedAns.length == questions.length) {
      setState(() {
        activePage = 'result-page';
      });
    }
  }

  void switchPage() {
    setState(() {
      // activePage = const QuizPage();
      activePage = 'quiz-page';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAns = [];
      activePage = 'quiz-page';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.shade900, Colors.deepPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activePage == 'home-page'
              ? HomePage(switchPage)
              : activePage == 'quiz-page'
                  ? QuizPage(onSelectedAns: chosenAns)
                  : ResultPage(
                      chosenAnswers: selectedAns,
                      onRestart: restartQuiz,
                    ),
        ),
      ),
    );
  }
}
