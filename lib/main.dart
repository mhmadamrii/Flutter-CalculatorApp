import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Calculator app",
      debugShowCheckedModeBanner: false,
      // home: Testing(),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Color kBrightGrey = const Color(0xFF4D4D4D);

  double firstNum = 0.0;
  double secondNum = 0.0;

  var input = '';
  var output = '';
  var operation = '';
  var hideInput = false;
  var outputSize = 34.0;

  onButtonClick(value) {
    if (value == "AC") {
      input = "";
      output = "";
    } else if (value == "<") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput.replaceAll("x", "*");
        Parser p = Parser();

        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();

        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        hideInput = true;
        outputSize = 50;
      }
    } else {
      input = input + value;
      hideInput = false;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hideInput ? '' : input,
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                      fontSize: outputSize,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              button(
                text: "AC",
                tColor: Colors.amber.shade800,
                btnBgColor: kBrightGrey,
              ),
              button(
                text: "<",
                tColor: Colors.amber.shade800,
                btnBgColor: kBrightGrey,
              ),
              button(
                text: "",
                btnBgColor: Colors.transparent,
              ),
              button(
                text: "/",
                tColor: Colors.amber.shade800,
                btnBgColor: kBrightGrey,
              ),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(
                text: "X",
                tColor: Colors.amber.shade800,
                btnBgColor: kBrightGrey,
              ),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "-"),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "+"),
            ],
          ),
          Row(
            children: [
              button(
                text: "%",
                tColor: Colors.amber.shade800,
                btnBgColor: kBrightGrey,
              ),
              button(text: "0"),
              button(text: "."),
              button(
                text: "=",
                btnBgColor: Colors.amber.shade800,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({
    text,
    tColor = Colors.white,
    Color btnBgColor = const Color(0xFF1E1E1E),
    // Color btnBgColor = const Color(0xFF424242),
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: btnBgColor,
            padding: const EdgeInsets.all(22),
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: tColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
