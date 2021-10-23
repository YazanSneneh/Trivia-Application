import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizz_brain.dart';
void main() => runApp(MyQuizz());

class MyQuizz extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text('TRIVIA'),
        ),
        body: Quizz(),
      ),
    );
  }
}

class Quizz extends StatefulWidget {

  @override
  _QuizzState createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  int scoreTracker = 0;
  int questionCount = 0;

  QuizzBrain questionsBank = new QuizzBrain();

  void checkUserAnswer(bool userAnswer){
    setState(() {
      if(questionCount >= questionsBank.getTotalQuestionsNumber()){
        if(scoreTracker > (questionsBank.getTotalQuestionsNumber()/2)){
          Alert(context: context, title: "Congratulations!", desc: 'You Pass with $scoreTracker').show();
        }else if(scoreTracker == (questionsBank.getTotalQuestionsNumber()/2)){
          Alert(context: context, title: "Not bad!!", desc: 'You got $scoreTracker out of ${questionsBank.getTotalQuestionsNumber()} you need to work on your knowledge!').show();
        }else{
          Alert(context: context, title: "Ohh!", desc: 'You Failed with $scoreTracker').show();
        }

        questionsBank.reset();
        questionCount =0;
        scoreTracker = 0;
      }else{
        if(questionsBank.getAnswer() == userAnswer){
          scoreTracker++;
        }
        questionCount++;
        questionsBank.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: Column(
          children: [
            Expanded(
              child: Text(
                "Score: $scoreTracker from ${questionsBank.getTotalQuestionsNumber()}",
                style: TextStyle(fontSize: 22),
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  questionsBank.getQuestion(),
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          child: Text('True'),
                          onPressed: () {
                            checkUserAnswer(true);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green, elevation: 5),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text('False'),
                        onPressed: () {
                          checkUserAnswer(false);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red, elevation: 5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
