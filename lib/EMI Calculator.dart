import 'dart:math';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class EmiCalculator extends StatefulWidget {
  @override
  EmiCalculatorState createState() => EmiCalculatorState();
}

class EmiCalculatorState extends State<EmiCalculator> {
  List _tenureTypes = ['Month(s)', 'Year(s)'];
  String _tenureType = "Year(s)";
  String _emiResult = "0.00";
  String _interstResult = "0.00";
  String _totalResult = "0.00";

  final TextEditingController _principalAmount = TextEditingController();
  final TextEditingController _interestRate = TextEditingController();
  final TextEditingController _tenure = TextEditingController();

  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffe5e5e5),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent,
            centerTitle: true,
            title: Text("EMI Calculator"),
            elevation: 0.0),
        body: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(top: 1.h, left: 3.w),
                child: Text(
                  "Loan Amount",
                  style: TextStyle(fontSize: 13.sp, color: Color(0xff8c8d90)),
                )),
            Container(
                height: 8.h,
                margin: EdgeInsets.all(5),
                child: TextField(
                  style: TextStyle(fontSize: 13.sp),
                  controller: _principalAmount,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    filled: true,
                    fillColor: Color(0xffe9e9e9),
                  ),
                  keyboardType: TextInputType.number,
                )),
            Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(top: 1.h, left: 3.w),
                child: Text(
                  "Intrest rate",
                  style: TextStyle(fontSize: 13.sp, color: Color(0xff8c8d90)),
                )),
            Container(
                height: 8.h,
                margin: EdgeInsets.all(5),
                child: TextField(
                  style: TextStyle(fontSize: 13.sp),
                  controller: _interestRate,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffe9e9e9),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  keyboardType: TextInputType.number,
                )),
            Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(top: 0.5.h, left: 4.w),
                child: Text(
                  "Loan Period",
                  style: TextStyle(fontSize: 13.sp, color: Color(0xff8c8d90)),
                )),
            Container(
                margin: EdgeInsets.only(left: 1.w),
                child: Row(
                  children: <Widget>[
                    Flexible(
                        flex: 4,
                        fit: FlexFit.tight,
                        child: Container(
                          height: 8.h,
                          child: TextField(
                            style: TextStyle(fontSize: 13.sp),
                            controller: _tenure,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffe9e9e9),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            keyboardType: TextInputType.number,
                          ),
                        )),
                    Flexible(
                        flex: 1,
                        child: Container(
                          child: Column(children: [
                            Text(_tenureType,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Switch(
                                activeColor: Colors.deepPurpleAccent,
                                value: _switchValue,
                                onChanged: (bool value) {
                                  print(value);
                                  if (value) {
                                    _tenureType = _tenureTypes[1];
                                  } else {
                                    _tenureType = _tenureTypes[0];
                                  }

                                  setState(() {
                                    _switchValue = value;
                                  });
                                })
                          ]),
                        ))
                  ],
                )),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: EdgeInsets.only(
                      left: 1.w, top: 1.h, right: 1.w, bottom: 2.h),
                  child: MaterialButton(
                      onPressed: _handleCalculation,
                      child: Text(
                        "Calculate",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      textColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.5.w, vertical: 1.h)),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 4.h,
                        color: Colors.white,
                        child: Text(
                          "EMI Detail",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(
                              top: 1.h, left: 1.w, bottom: 1.h, right: 1.w),
                          child: Text(
                            "EMI per Month with Interest",
                            style: TextStyle(fontSize: 14.sp),
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.all(1.h),
                        child: Text(
                          _emiResult,
                          style:
                              TextStyle(color: Colors.green, fontSize: 15.sp),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 1.h, bottom: 1.h, right: 1.h),
                          child: Text(
                            "Total Interest",
                            style: TextStyle(fontSize: 14.sp),
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.all(1.h),
                        child: Text(
                          _interstResult,
                          style:
                              TextStyle(color: Colors.green, fontSize: 14.sp),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 1.w, bottom: 1.h, right: 1.w),
                          child: Text(
                            "Total Payment",
                            style: TextStyle(fontSize: 15.sp),
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.all(1.h),
                        child: Text(
                          _totalResult,
                          style:
                              TextStyle(color: Colors.green, fontSize: 14.sp),
                        )),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 2.w, right: 2.w),
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                _principalAmount.text = "";
                                _interestRate.text = "";
                                _tenure.text = "";

                                _emiResult = "0.0";
                                _interstResult = "0.0";
                                _totalResult = "0.0";
                              });
                            },
                            child: Text(
                              "Reset",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            textColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 2.h)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  void _handleCalculation() {
    //todo   A = Payemtn amount per period
    // todo P = Initial Printical (loan amount)
    //todo r = interest rate
    //todo n = total number of payments or periods

    double A = 0.0;
    double interestamt = 0;
    double principalandinterest = 0;

    int P = int.parse(_principalAmount.text);
    double r = int.parse(_interestRate.text) / 12 / 100;
    int n = _tenureType == "Year(s)"
        ? int.parse(_tenure.text) * 12
        : int.parse(_tenure.text);

    A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));

    _emiResult = A.toStringAsFixed(2);

    interestamt = P - A;

    principalandinterest = A * n;
    print(principalandinterest);

    interestamt = principalandinterest - P;
    print(interestamt);
    _interstResult = interestamt.toStringAsFixed(2);
    _totalResult = principalandinterest.toStringAsFixed(2);

    setState(() {});
  }
}
