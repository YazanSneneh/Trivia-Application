import 'package:flutter/material.dart';

void main() => runApp(MyQuizz());

class MyQuizz extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text('Quizz me'),
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: Column(
          children: [
            Expanded(
              child: Text(
                "Score: $scoreTracker from 10",
                style: TextStyle(fontSize: 22),
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  "What do you want for today?",
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
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green, elevation: 5)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text('False'),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red, elevation: 5),
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
