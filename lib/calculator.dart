import 'package:flutter/material.dart';

class cal extends StatefulWidget {
  const cal({super.key});

  @override
  State<cal> createState() => _calState();
}

class _calState extends State<cal> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    double sb_size = screen.width * 0.2;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        // appBar: AppBar(
        //   title: Text("Calculator"),
        //   centerTitle: true,
        //   backgroundColor: Colors.green,
        // ),
        body: Center(
          child: Container(
            // color: Colors.grey[300],
            height: screen.height * 0.9,
            width: screen.width * 0.9,
            child: Column(
              children: [
                SizedBox(
                  height: screen.height * 0.01,
                ),
                SizedBox(
                  child: Card(
                    color: Colors.green[300],
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      padding: EdgeInsets.only(
                          right: screen.width * 0.04,
                          bottom: screen.width * 0.04),
                      height: screen.height * 0.15,
                      width: screen.width * 0.8,
                      child: SingleChildScrollView(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    child: Text(
                                      "$history",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ),
                                  SizedBox(
                                    child: Text(
                                      "$display",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 35),
                                    ),
                                  )
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screen.height * 0.01,
                ),
                Expanded(
                  // color: Colors.yellow,
                  // width: screen.width * 0.9,
                  // height: screen.height * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: screen.height * 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                cal_btn("1", Colors.indigo, sb_size),
                                cal_btn("4", Colors.indigo, sb_size),
                                cal_btn("7", Colors.indigo, sb_size),
                                cal_btn("=", Colors.teal, sb_size),
                                // cal_btn("%", Colors.red),
                              ],
                            ),
                          ),
                          Container(
                            height: screen.height * 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                cal_btn("2", Colors.indigo, sb_size),
                                cal_btn("5", Colors.indigo, sb_size),
                                cal_btn("8", Colors.indigo, sb_size),
                                cal_btn("0", Colors.indigo, sb_size),
                              ],
                            ),
                          ),
                          Container(
                            height: screen.height * 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                cal_btn("3", Colors.indigo, sb_size),
                                cal_btn("6", Colors.indigo, sb_size),
                                cal_btn("9", Colors.indigo, sb_size),
                                cal_btn("+", Colors.red, sb_size),
                              ],
                            ),
                          ),
                          Container(
                            height: screen.height * 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                cal_btn("C", Colors.black, sb_size),
                                cal_btn("x", Colors.red, sb_size),
                                cal_btn("÷", Colors.red, sb_size),
                                cal_btn("-", Colors.red, sb_size),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  int s_action = 0;
  String history = "";
  String btn_text = "";
  String display = '';
  int first = 0;
  int second = 0;
  String sign = "";
  Widget cal_btn(String text, Color btn_color, double b_size) {
    return SizedBox(
      height: b_size,
      width: b_size,
      child: ElevatedButton(
          style:
              ButtonStyle(backgroundColor: MaterialStatePropertyAll(btn_color)),
          onPressed: () {
            click(text);
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 30),
          )),
    );
  }

  click(String action) {
    try {
      if (action == "C") {
        display = "";
        btn_text = "";
        first = 0;
        second = 0;
        history = "";
        sign = "";
      } else if (action == "+" ||
          action == "-" ||
          action == "x" ||
          action == "÷" ||
          action == "%") {
        first = int.parse(display);
        sign = action;
        display = "";
        btn_text = "";
      } else if (action == "=") {
        second = int.parse(display);
        // print(first + second);
        if (sign == "+") {
          btn_text = (first + second).toString();
        }
        if (sign == "-") {
          btn_text = (first - second).toString();
        }
        if (sign == "x") {
          btn_text = (first * second).toString();
        }
        if (sign == "÷") {
          btn_text = (first / second).toString();
        }
        setState(() {
          history = first.toString() + sign + second.toString();
        });
      } else {
        btn_text = display + action;
      }
    } catch (e) {
      SnackBar alter_message = SnackBar(
          content: Center(
        child: Column(
          children: const [
            SizedBox(
              child: Text(
                "Input is Not Valid ! Enter valid input",
                style: TextStyle(fontSize: 13),
              ),
            ),
            SizedBox(
                child: Text(
              "Press 'C' button to Continue...",
              style: TextStyle(fontSize: 15),
            ))
          ],
        ),
      ));
      ScaffoldMessenger.of(context).showSnackBar(alter_message);
    }
    ;
    setState(() {
      display = btn_text;
      print(display);
    });
  }
}
