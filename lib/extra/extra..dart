// 💨 EASY UNDERSTANDABLE CODE



import 'package:calculator/custom_widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Screen extends StatefulWidget {
  Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  // variables
  var userInput = '';

  var answer = '';

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                      ),
                      Text(
                        userInput.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        answer.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    // 1st row
                    Row(
                      children: [
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput = '';
                              answer = '';
                            });
                          },
                          text: "AC",
                        ),
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += '+/-';
                            });
                          },
                          text: "+/-",
                        ),
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += '%';
                            });
                          },
                          text: "%",
                        ),
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += '/';
                            });
                          },
                          text: "/",
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    // 2nd row
                    Row(
                      children: [
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += '7';
                            });
                          },
                          text: "7",
                        ),
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += '8';
                            });
                          },
                          text: "8",
                        ),
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += '9';
                            });
                          },
                          text: "9",
                        ),
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += 'x';
                            });
                          },
                          text: "x",
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    // 3rd row
                    Row(
                      children: [
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += '4';
                            });
                          },
                          text: "4",
                        ),
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += '5';
                            });
                          },
                          text: "5",
                        ),
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += '6';
                            });
                          },
                          text: "6",
                        ),
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += '-';
                            });
                          },
                          text: "-",
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    // 4th row
                    Row(
                      children: [
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += '1';
                            });
                          },
                          text: "1",
                        ),
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += '2';
                            });
                          },
                          text: "2",
                        ),
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += '3';
                            });
                          },
                          text: "3",
                        ),
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += '+';
                            });
                          },
                          text: "+",
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    // 5th row
                    Row(
                      children: [
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += '0';
                            });
                          },
                          text: "0",
                        ),
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput += '.';
                            });
                          },
                          text: ".",
                        ),
                        Circle(
                          onPress: () {
                            setState(() {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            });
                          },
                          text: "DEL",
                        ),
                        Circle(
                          onPress: () {
                            setState(() {
                              equalPress();
                            });
                          },
                          text: "=",
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void equalPress() {
    // replace x with *
    String finalUserInput = userInput.replaceAll('x', '*');

    // Creates an instance of the Parser class from the math_expressions package.
    // This parser is capable of interpreting and processing mathematical expressions provided as strings.
    Parser p = Parser();

    // passing the expression which we get from user
    // represents the mathematical expression in a form that can be evaluated programmatically.
    Expression expression = p.parse(finalUserInput);

    // initializes a ContextModel, which holds the values of any variables that might be present in the expression.
    // In this case, since there are no variables (only numbers and operators), the context model remains empty.
    ContextModel contextModel = ContextModel();

    // Evaluates the parsed expression as a real number.
    // The EvaluationType.REAL specifies that the evaluation should be done in the realm of real numbers.
    // The contextModel provides the necessary context for any variables; since there are none, it doesn't influence the evaluation in this scenario.
    double evaluate = expression.evaluate(EvaluationType.REAL, contextModel);

    // store in the answer and convert expression into string
    answer = evaluate.toString();
  }
}