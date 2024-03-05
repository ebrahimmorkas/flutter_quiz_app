// This is the file which contains the blueprint of questions and answers

class QuestionsBlueprint {
  const QuestionsBlueprint(this.question, this.answersList);
  final String question;
  final List<String> answersList;
  List<String> shuffleElements() {
    final shuffledList = List.of(answersList);
    shuffledList.shuffle();
    return shuffledList;
  }
}