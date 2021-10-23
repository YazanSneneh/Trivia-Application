import 'package:my_quizz_app/questions.dart';

class QuizzBrain{
  int _index = 0;
  List<Question> _questions =[
    Question("John F. Kennedy is one of the four U.S. President who is on Mount Rushmore", false),
    Question("Mice have more bones than humans.", true),
    Question("A male canary tends to have a better singing voice than a female canary.", true),
    Question("Tea contains more caffeine than coffee and soda.", false),
    Question("The first product with a bar code was chewing gum.", true),
    Question("The Beatles is a famous rock band from Manchester, the United Kingdom.", false),
    Question("A centaur, a mythical creature in many fictional works, is a combination of humans and dragons.", false),
    Question("The capital of Australia is Sydney.", false),
    Question("The World War II began in 1939 when Germany invaded Poland.", true),
    Question("AB- is the rarest type of blood in humans.", true),
    Question("There is a total of 24 time zones in the world.", true),
    Question("Lungs are the largest internal organ in the human body.", false),
    Question("The Statue of Liberty was a gift of France for the United States of America in 1886.", true),
    Question("The Statue of Liberty was a gift of France for the United States of America in 1886.", true),
  ];

  void nextQuestion(){
    if(_index < _questions.length-1){
      _index++;
    }
  }
  String getQuestion(){
   return _questions[_index].questionText;
  }

  bool getAnswer(){
    return _questions[_index].answer;
  }

  int getTotalQuestionsNumber(){
    return _questions.length;
  }

  void reset(){
    _index =0;
  }
}