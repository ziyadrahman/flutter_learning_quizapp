import 'Question.dart';
import 'common.dart';

class Questionbrain {
  int questionNumber = 0;

  Common commonMethods = Common();

  //Private Variable defined by (_)underscore which is not accessible for other classes
  final List<Question> _questionAnsList = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  //Public Methods with controlled access
  String get questionText => _questionAnsList[questionNumber].text;
  // int get questionNumber => _questionNumber;
  bool get questionAnswer => _questionAnsList[questionNumber].answer;

  int get questionSize => _questionAnsList.length;

  void nextQuestion() {
    if (questionNumber < _questionAnsList.length - 1) {
      questionNumber++;
    }
  }

  bool isFinished() {
    if (questionSize - 1 == questionNumber) {
      commonMethods.printInLog('questionBrain', 'isQuestionFinished', 1);
      return true;
    } else {
      commonMethods.printInLog('questionBrain', 'isQuestionFinished', 0);
      return false;
    }
  }

  void reset() {
    questionNumber = 0;
  }
}
