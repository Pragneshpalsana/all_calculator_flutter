import 'dart:ui';
import 'package:calculator_upwork_final/Calculator.dart';
import 'package:sizer/sizer.dart';
import 'package:calculator_upwork_final/EMI%20Calculator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Gst Calculator.dart';
import 'SIP Calculator.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: ThemeData.light(),
          home: CalculatorApp(),
        );
      },
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff46c1c2),
        title: Text("Select Calculator Type"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                      margin: EdgeInsets.all(2.h),
                      child: Calculator("asset/image/Group 1.png", "Calculator")),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SimpleCalculator();
                      },
                    ));
                  },
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return EmiCalculator();
                      },
                    ));
                  },
                  child: Container(
                      margin: EdgeInsets.all(2.h),
                      child: Calculator(
                          "asset/image/Group 5.png", "EMI Calculator")),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return GstCalculator();
                      },
                    ));
                  },
                  child: Container(
                      margin: EdgeInsets.all(2.h),
                      child: Calculator(
                          "asset/image/Group 2.png", "GST Calculator")),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SipCalculator();
                      },
                    ));
                  },
                  child: Container(
                      margin: EdgeInsets.all(2.h),
                      child: Calculator(
                          "asset/image/Group 3.png", "SIP Calculator")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget Calculator(String image, String name) {
    return Container(
        height: 21.h,
        width: 40.w,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 2.h),
              child: Image(
                height: 11.h,
                image: AssetImage(image),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 2.h),
                child: Text(
                  name,
                  style: TextStyle(
                      color: Color(0xff46c1c2), fontWeight: FontWeight.bold),
                ))
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              spreadRadius: 1,
              blurRadius: 1.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ));
  }
}
