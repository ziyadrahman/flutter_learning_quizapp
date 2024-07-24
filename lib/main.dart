import 'package:flutter/material.dart';
import 'QuestionBrain.dart';

Questionbrain questionbrain = Questionbrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //Testing
  String pageName = "questionPage";
  List<Widget> scoreKeeper = [];
  // List<String> questionList = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s  blood is green.'
  // ];

  int questionNumber = 0;
  late String currentQuestion;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // currentQuestion = questionList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionbrain.questionAnsList[questionNumber].text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.green)),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  printInLog("before if questionNumber", questionNumber);
                  if (questionNumber <=
                      questionbrain.questionAnsList.length - 1) {
                    if (checkAnswerRight(questionNumber, true)) {
                      scoreKeeper.add(
                        const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                    } else {
                      scoreKeeper.add(
                        const Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    }
                  }
                  // if (questionNumber < questionAnsList.length - 1) {
                  questionNumber++;
                  // }

                  printInLog("questionNumber", questionNumber);
                  printInLog("questionAnsList Length=",
                      (questionbrain.questionAnsList.length - 1));
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red)),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.

                setState(() {
                  if (questionNumber <
                      questionbrain.questionAnsList.length - 1) {
                    if (checkAnswerRight(questionNumber, false)) {
                      scoreKeeper.add(
                        const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                    } else {
                      scoreKeeper.add(
                        const Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    }

                    questionNumber++;
                  }
                });
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper

        Row(
          children: scoreKeeper,
        )
      ],
    );
  }

  bool checkAnswerRight(int questionNumber, bool userOption) {
    return questionbrain.questionAnsList[questionNumber].answer == userOption;
  }

  void printInLog(String data, int value) {
    print('$pageName $data $value');
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
