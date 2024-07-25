import 'Question.dart';

class Questionbrain {
  int questionNumber = 0;

  //Private Variable defined by (_)underscore which is not accessible for other classes
  final List<Question> _questionAnsList = [
    Question('You can lead a cow down stairs but not up stairs.', true),
    Question(
        'Approximately one quarter of human bones are in the feet.', false),
    Question('A slug\'s  blood is green.', true)
  ];

  //Public Methods with controlled access
  String get questionText => _questionAnsList[questionNumber].text;
  // int get questionNumber => _questionNumber;
  bool get questionAnswer => _questionAnsList[questionNumber].answer;

  void nextQuestion() {
    if (questionNumber < _questionAnsList.length - 1) {
      questionNumber++;
    }
  }
}
