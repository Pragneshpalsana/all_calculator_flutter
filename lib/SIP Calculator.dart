import 'package:flutter/material.dart';
import 'dart:math';
import 'package:sizer/sizer.dart';

class SipCalculator extends StatefulWidget {
  const SipCalculator({Key? key}) : super(key: key);

  @override
  _SipCalculatorState createState() => _SipCalculatorState();
}

class _SipCalculatorState extends State<SipCalculator> {
  TextEditingController investment_controler = TextEditingController();
  TextEditingController rate_controler = TextEditingController();
  TextEditingController time_controler = TextEditingController();

  late int Investment_Amt;
  late int Return;
  late int Total_Value;

  String Investment_Display = "0.00";
  String Total_Display = "0.00";
  String Return_Display = "0.00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe5e5e5),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: Text("SIP Calculator"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(top: 1.h, left: 2.w),
                  child: Text(
                    "Monthly Investment",
                    style: TextStyle(fontSize: 13.sp, color: Color(0xff8c8d90)),
                  )),
              Container(
                height: 8.h,
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    style: TextStyle(fontSize: 18.sp),
                    controller: investment_controler,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffe9e9e9),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)))),
                    keyboardType: TextInputType.number,
                  )),
              Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(top: 2.h, left: 2.w),
                  child: Text(
                    "Expected Return Rate",
                    style: TextStyle(fontSize: 13.sp, color: Color(0xff8c8d90)),
                  )),
              Container(
                  height: 8.h,
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    style: TextStyle(fontSize: 18.sp),
                    controller: rate_controler,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffe9e9e9),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    keyboardType: TextInputType.number,
                  )),
              Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(top: 2.h, left: 2.w),
                  child: Text(
                    "Time Period",
                    style: TextStyle(fontSize: 13.sp, color: Color(0xff8c8d90)),
                  )),
              Container(
                height: 8.h,
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    style: TextStyle(fontSize: 18.sp),
                    controller: time_controler,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffe9e9e9),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    keyboardType: TextInputType.number,
                  )),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      margin: EdgeInsets.all(5),
                      child: MaterialButton(
                          onPressed: () {
                            CalculationSIP();
                          },
                          child: Text(
                            "Calculate",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                          textColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 2.h)),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "Invested Amount",
                              style: TextStyle(fontSize: 15.sp),
                            )),
                      ),
                      Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            Investment_Display,
                            style:
                                TextStyle(color: Colors.green, fontSize: 15.sp),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "Est. Returns",
                              style: TextStyle(fontSize: 15.sp),
                            )),
                      ),
                      Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            Return_Display,
                            style:
                                TextStyle(color: Colors.green, fontSize: 15.sp),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "Total Value",
                              style: TextStyle(fontSize: 15.sp),
                            )),
                      ),
                      Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            Total_Display,
                            style:
                                TextStyle(color: Colors.green, fontSize: 15.sp),
                          )),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xffff6262),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            Total_Display = "0.0";
                            Investment_Display = "0.0";
                            Total_Display = "0.0";
                            Return_Display = "0.0";

                            investment_controler.text = "";
                            rate_controler.text = "";
                            time_controler.text = "";
                          });
                        },
                        child: Text(
                          "Reset",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        textColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.8.h)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void CalculationSIP() {
    double investment = 0.0;

    int P = int.parse(investment_controler.text);
    double r = int.parse(rate_controler.text) / 12 / 100;
    int n = int.parse(time_controler.text) * 12;

    investment = (P * (pow((1 + r), n) - 1) * (1 + r) / r);

    Total_Display = investment.toStringAsFixed(2);
    Investment_Amt = P * n;

    Investment_Display = Investment_Amt.toStringAsFixed(2);

    double diff = investment - Investment_Amt;
    Return_Display = diff.toStringAsFixed(2);

    setState(() {});
  }
}
