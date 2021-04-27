import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

List<Icon> scoreKeeper = [];
QuizBrain quizBrain = QuizBrain();

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: QuizPage(),
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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                quizBrain.getQuestion(),
                // qMap.keys.skip(questionIndex).single,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                  onPressed: () => checkAnsware(true),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.all(16.0),
                  ),
                  child: Text(
                    'TRUE',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextButton(
                  onPressed: () => checkAnsware(false),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.all(16.0),
                  ),
                  child: Text(
                    'FALSE',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              children: [
                Row(
                  children: scoreKeeper,
                ),
                SizedBox(
                  height: 2.0,
                ),
                TextButton(
                  onPressed: () => {
                    setState(() =>
                        {scoreKeeper = [], quizBrain.resetQuestionIndex()}),
                  },
                  child: Text(
                    'Reset score',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
//
// class _QuizPageState extends State<QuizPage> {
//   List<Icon> scoreKeeper = [];
//   // Future<Map<String, dynamic>> questions = getQuestions();
//   Map<String, bool> qMap = {
//     'The Great Wall of China is visible from the moon.': true,
//     'French is an official language in Canada.': true,
//     'A scientific study on peanuts in bars found traces of over 100 unique specimens of urine.':
//         false,
//     'In 2010, Twitter and the United States Library of Congress partnered together to archive every tweet by American citizens.':
//         true,
//     'When you cry in space, your tears stick to your face.': true
//   };
//
//   int questionIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Expanded(
//           flex: 5,
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 qMap.keys.elementAt(questionIndex),
//                 // qMap.keys.skip(questionIndex).single,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontStyle: FontStyle.italic,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 3,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 TextButton(
//                   onPressed: () => checkAnsware(scoreKeeper,
//                       qMap.values.elementAt(questionIndex) == true),
//                   style: TextButton.styleFrom(
//                     primary: Colors.white,
//                     backgroundColor: Colors.green,
//                     padding: EdgeInsets.all(16.0),
//                   ),
//                   child: Text(
//                     'TRUE',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 16.0,
//                 ),
//                 TextButton(
//                   onPressed: () => checkAnsware(scoreKeeper,
//                       qMap.values.elementAt(questionIndex) == false),
//                   style: TextButton.styleFrom(
//                     primary: Colors.white,
//                     backgroundColor: Colors.red,
//                     padding: EdgeInsets.all(16.0),
//                   ),
//                   child: Text(
//                     'FALSE',
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Padding(
//             padding: const EdgeInsets.only(
//               left: 16.0,
//               right: 16.0,
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   children: scoreKeeper,
//                 ),
//                 SizedBox(
//                   height: 2.0,
//                 ),
//                 TextButton(
//                   onPressed: () => {
//                     setState(() => {scoreKeeper = [], questionIndex = 0}),
//                   },
//                   child: Text(
//                     'Reset score',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

  // static Future<Map<String, dynamic>> getQuestions() async {
  //   final String _endpoint = "https://randomuser.me/api/";
  //   final Dio _dio = Dio();
  //   Response response = Response();
  //   response = await _dio.get(_endpoint);
  //   print(response.data.toString());
  // }

  void checkAnsware(bool userChoice) {
    IconData iconData =
        userChoice == quizBrain.getAnsware() ? Icons.check : Icons.close;
    Color iconColor =
        userChoice == quizBrain.getAnsware() ? Colors.green : Colors.red;
    setState(
      () => {
        quizBrain.isFinished()
            ? {
                Alert(
                    context: context,
                    title: 'Finished!',
                    desc: 'You\'ve reached the end of the quiz.',
                    type: AlertType.success,
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Close",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        color: Colors.grey.shade900,
                        radius: BorderRadius.circular(5.0),
                      ),
                    ],
                    style: AlertStyle(
                      backgroundColor: Colors.white,
                    )).show(),
                scoreKeeper = [],
                quizBrain.resetQuestionIndex(),
              }
            : {
                scoreKeeper.add(
                  Icon(
                    iconData,
                    color: iconColor,
                  ),
                ),
                quizBrain.nextQuestion(),
              },
      },
    );
  }
}
