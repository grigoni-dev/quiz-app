import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Icon> scoreKeeper = [];
  Future<Map<String, dynamic>> questions = getQuestions();
  Map<String, bool> qMap = {
    'The Great Wall of China is visible from the moon.': true,
    'French is an official language in Canada.': true,
    'A scientific study on peanuts in bars found traces of over 100 unique specimens of urine.':
        false,
    'In 2010, Twitter and the United States Library of Congress partnered together to archive every tweet by American citizens.':
        true,
    'When you cry in space, your tears stick to your face.': true
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  // decoration: BoxDecoration(
                  //   color: Colors.transparent,
                  //   border: Border.all(
                  //     color: Colors.grey.shade700,
                  //     width: 2,
                  //   ),
                  //   borderRadius: BorderRadius.zero,
                  // ),
                  child: Center(
                    child: Text(
                      'This is first question.',
                      style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
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
                        onPressed: () => {
                          setState(
                            () => {
                              scoreKeeper.length > 12
                                  ? {}
                                  : scoreKeeper.add(
                                      Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      ),
                                    ),
                            },
                          ),
                        },
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
                        onPressed: () => {
                          setState(
                            () => {
                              scoreKeeper.length > 12
                                  ? {}
                                  : scoreKeeper.add(
                                      Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                    ),
                            },
                          ),
                        },
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
                          setState(() => scoreKeeper = []),
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
          ),
        ),
      ),
    );
  }

  static Future<Map<String, dynamic>> getQuestions() async {
    final String _endpoint = "https://randomuser.me/api/";
    final Dio _dio = Dio();
    Response response = Response();
    response = await _dio.get(_endpoint);
    print(response.data.toString());
  }
}
