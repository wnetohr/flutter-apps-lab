import 'package:calcflutter/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyCalc(),
    );
  }
}

class MyCalc extends StatefulWidget {
  @override
  _MyCalcState createState() => _MyCalcState();
}

class _MyCalcState extends State<MyCalc> {
  List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '.',
    '0',
    'ANS',
    '='
  ];
  var userQuestion = '';
  var userAnswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(userQuestion),
                      )),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(userAnswer),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SafeArea(
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Mybuttons(
                          buttontapped: () {
                            setState(() {
                              userQuestion = '';
                            });
                          },
                          textButton: buttons[index],
                          buttoncolor: Colors.greenAccent,
                          textColor: Colors.white);
                    } else if (index == 1) {
                      return Mybuttons(
                          buttontapped: () {
                            setState(() {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1);
                            });
                          },
                          textButton: buttons[index],
                          buttoncolor: Colors.red[200],
                          textColor: Colors.white);
                    } else if (index == buttons.length - 1) {
                      return Mybuttons(
                          buttontapped: () {
                            setState(() {
                              calcQuestion();
                              userQuestion = '';
                            });
                          },
                          textButton: buttons[index],
                          buttoncolor: Colors.red[200],
                          textColor: Colors.white);
                    } else {
                      return Mybuttons(
                          buttontapped: () {
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                          textButton: buttons[index],
                          buttoncolor: isOperator(buttons[index])
                              ? Colors.grey
                              : Colors.white,
                          textColor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.grey);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void calcQuestion() {
    String finalAnswer = userQuestion;

    Parser p = Parser();
    Expression exp = p.parse(finalAnswer);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
