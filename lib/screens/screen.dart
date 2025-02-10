// 💨💨💨 Short and advanced code

import 'package:calculator/custom_widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Screen extends StatefulWidget {
  Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textSize = screenWidth * 0.08; // Responsive text size

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
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
                        userInput,
                        style:
                            TextStyle(fontSize: textSize, color: Colors.white),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        answer,
                        style:
                            TextStyle(fontSize: textSize, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    buildButtonRow(["AC", "+/-", "%", "/"],
                        [null, null, null, Colors.orange]),
                    buildButtonRow(["7", "8", "9", "x"],
                        [null, null, null, Colors.orange]),
                    buildButtonRow(["4", "5", "6", "-"],
                        [null, null, null, Colors.orange]),
                    buildButtonRow(["1", "2", "3", "+"],
                        [null, null, null, Colors.orange]),
                    buildButtonRow(["0", ".", "DEL", "="],
                        [null, null, null, Colors.orange]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> labels, List<Color?> colors) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(labels.length, (index) {
          return Expanded(
            child: Circle(
              onPress: () => handleButtonPress(labels[index]),
              text: labels[index],
              color: colors[index] ?? Colors.grey,
            ),
          );
        }),
      ),
    );
  }

  void handleButtonPress(String text) {
    setState(() {
      if (text == "AC") {
        userInput = '';
        answer = '';
      } else if (text == "DEL") {
        if (userInput.isNotEmpty) {
          userInput = userInput.substring(0, userInput.length - 1);
        }
      } else if (text == "=") {
        equalPress();
      } else {
        userInput += text;
      }
    });
  }

  void equalPress() {
    try {
      String finalUserInput = userInput.replaceAll('x', '*');
      Parser p = Parser();
      Expression expression = p.parse(finalUserInput);
      ContextModel contextModel = ContextModel();
      double evaluate = expression.evaluate(EvaluationType.REAL, contextModel);
      answer = evaluate.toString();
    } catch (e) {
      answer = "Error";
    }
  }
}
