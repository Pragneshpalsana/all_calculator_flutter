import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  late int FirstNumber;
  late int SecondNumber;
  late String TextToDisplay = "";
  late String Result;
  late String Oprators;

  ButtonClick(String ButtonValue) {
    if (ButtonValue == "C") {
      TextToDisplay = "";
      FirstNumber = 0;
      SecondNumber = 0;
      Result = "0";
    } else if (ButtonValue == "D") {
      Result = TextToDisplay.substring(0, TextToDisplay.length - 1);
    } else if (ButtonValue == "+" ||
        ButtonValue == "-" ||
        ButtonValue == "*" ||
        ButtonValue == "/") {
      FirstNumber = int.parse(TextToDisplay);
      Result = "";
      Oprators = ButtonValue;
    } else if (ButtonValue == "=") {
      SecondNumber = int.parse(TextToDisplay);
      if (Oprators == "+") {
        Result = (FirstNumber + SecondNumber).toString();
      }
      if (Oprators == "-") {
        Result = (FirstNumber - SecondNumber).toString();
      }
      if (Oprators == "*") {
        Result = (FirstNumber * SecondNumber).toString();
      }
      if (Oprators == "/") {
        Result = (FirstNumber / SecondNumber).toString();
      }
    } else {
      Result = int.parse(TextToDisplay + ButtonValue).toString();
    }

    setState(() {
      TextToDisplay = Result;
    });
  }

  Widget button(String ButtonValue, Color ButtonColor) {
    return Container(
        margin: EdgeInsets.only(top: 1.h, right: 1.w),
        child: OutlinedButton(
          child: Text(
            ButtonValue,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
          onPressed: () => ButtonClick(ButtonValue),
          style: OutlinedButton.styleFrom(
            backgroundColor: ButtonColor,
            shape: CircleBorder(),
            padding: EdgeInsets.all(4.h),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        centerTitle: true,
        title: Text("Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 2.h),
            alignment: Alignment.bottomRight,
            child: Text(
              TextToDisplay,
              style: TextStyle(fontSize: 35.sp, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            children: [
              Expanded(
                  child:
                      Container(child: button("C", Colors.deepOrangeAccent))),
              Expanded(
                  child:
                      Container(child: button("/", Colors.deepOrangeAccent))),
              Expanded(
                  child:
                      Container(child: button("*", Colors.deepOrangeAccent))),
              Expanded(
                  child: Container(child: button("D", Colors.deepOrangeAccent)))
            ],
          ),
          Row(
            children: [
              Expanded(child: button("7", Color(0x31ffffff))),
              Expanded(child: button("8", Color(0x31ffffff))),
              Expanded(child: button("9", Color(0x31ffffff))),
              Expanded(child: button("-", Colors.deepOrangeAccent))
            ],
          ),
          Row(
            children: [
              Expanded(child: button("4", Color(0x31ffffff))),
              Expanded(child: button("5", Color(0x31ffffff))),
              Expanded(child: button("6", Color(0x31ffffff))),
              Expanded(child: button("+", Colors.deepOrangeAccent)),
            ],
          ),
          Container(
            child: Row(
              children: [
                Expanded(child: button("1", Color(0x31ffffff))),
                Expanded(child: button("2", Color(0x31ffffff))),
                Expanded(child: button("3", Color(0x31ffffff))),
                Expanded(child: button("=", Colors.deepOrangeAccent))
              ],
            ),
          )
        ],
      ),
    );
  }
}
