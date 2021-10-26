import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GstCalculator extends StatefulWidget {
  const GstCalculator({Key? key}) : super(key: key);

  @override
  _GstCalculatorState createState() => _GstCalculatorState();
}

class _GstCalculatorState extends State<GstCalculator> {
  TextEditingController GstAmt_Controller = TextEditingController();
  TextEditingController GstRate_Controller = TextEditingController();

  double FirstFieldValue = 0;
  double SecondFieldValue = 0;

  String DisplayGstAmount = "0.00";
  String DisplayTotal = "0.00";
  String expected = "0.00";

  //todo Including Gst
  late String IncludingGst;
  late String IncludingGstTotal;

  //todo Excluding  Gst
  late String ExcludingGst;
  late String ExcludingGstTotal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe5e5e5),
      appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text("GST Calculator"),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5.w, top: 2.h),
              alignment: Alignment.centerLeft,
              child: Text(
                "Intial Amount",
                style: TextStyle(color: Color(0xff6f6f72), fontSize: 13.sp),
              ),
            ),
            Container(
              height: 8.h,
              margin: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h),
              child: TextField(
                style: TextStyle(
                    color: Colors.black, fontSize: 12.sp, height: 0.2.h),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    expected = value;
                    print(expected);
                  });

                  if (value.isEmpty) {
                    setState(() => FirstFieldValue = 0);
                  } else {
                    setState(() {
                      FirstFieldValue = double.parse(value);
                    });
                  }
                },
                controller: GstAmt_Controller,
                decoration: InputDecoration(
                  fillColor: Color(0xffd0cfcf),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 2.w, top: 2.w),
              alignment: Alignment.centerLeft,
              child: Text(
                "% of GST",
                style: TextStyle(color: Color(0xff6f6f72), fontSize: 13.sp),
              ),
            ),
            Container(
              height: 8.h,
              margin: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h),
              child: TextField(
                  style: TextStyle(
                      color: Colors.black, fontSize: 12.sp, height: 0.2.h),
                  keyboardType: TextInputType.number,
                  controller: GstRate_Controller,
                  decoration: InputDecoration(
                    fillColor: Color(0xffd0cfcf),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    suffix: Text("%"),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() => SecondFieldValue = 0);
                    } else {
                      setState(() {
                        SecondFieldValue = double.parse(value);
                      });
                    }
                  }),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 8.h,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          IncludingGst =
                          "${FirstFieldValue * SecondFieldValue / 100}";
                          DisplayGstAmount = IncludingGst;

                          IncludingGstTotal =
                          "${FirstFieldValue * SecondFieldValue / 100 + FirstFieldValue}";
                          DisplayTotal = IncludingGstTotal;
                        });
                      },
                      child: Text(
                        "+ Add GST",
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 8.h,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          ExcludingGst =
                          "${FirstFieldValue * SecondFieldValue / (SecondFieldValue + 100)}";

                          String StringTwoDigitgst =
                          double.parse(ExcludingGst).toStringAsFixed(2);
                          DisplayGstAmount = StringTwoDigitgst;

                          ExcludingGstTotal =
                          "${(FirstFieldValue) - FirstFieldValue * SecondFieldValue / (SecondFieldValue + 100)}";

                          String StringTwoDigittotal =
                          double.parse(ExcludingGstTotal)
                              .toStringAsFixed(2);

                          DisplayTotal = StringTwoDigittotal;
                        });
                      },
                      child: Text(
                        "- Subtract GST",
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 5.h,
                    color: Colors.white,
                    child: Text(
                      "GST Detail",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            Container(
              margin: EdgeInsets.all(2),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                        "Initial Amount",
                        style: TextStyle(fontSize: 17.sp),
                      )),
                  Text(
                    expected,
                    style: TextStyle(color: Colors.green, fontSize: 20.sp),
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.all(2),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                        "GST Amount",
                        style: TextStyle(fontSize: 17.sp),
                      )),
                  Text(
                    DisplayGstAmount,
                    style: TextStyle(color: Colors.green, fontSize: 20.sp),
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.all(2),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                        "Total Amount",
                        style: TextStyle(fontSize: 17.sp),
                      )),
                  Text(
                    DisplayTotal,
                    style: TextStyle(color: Colors.green, fontSize: 20.sp),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
