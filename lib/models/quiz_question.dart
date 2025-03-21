class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  // List<String> getShuffleAns() {
  //   final shuffledList = List.of(answers);
  //   shuffledList.shuffle();
  //   return shuffledList;
  // }

  List<String> get shuffleAns {
    final shuffledList = List.of(answers); // copy a list of the answer
    shuffledList.shuffle();
    return shuffledList;
  }
}
