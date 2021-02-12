import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nurtureland/screens/timer_screen.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:nurtureland/Models/minutes.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color gradientStart = Colors.green[300];
  Color gradientEnd = Colors.yellow[200];
  int _seconds = 00;
  int _minutes = 25;
  Minutes selectedMinute;
  var f = NumberFormat("00");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [gradientStart, gradientEnd],
              begin: const FractionalOffset(0.5, 0.0),
              end: const FractionalOffset(0.0, 0.5),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleCircularSlider(
              120,
              25,
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 3,
              child: Center(
                child: Text(
                  "${f.format(_minutes)} : ${f.format(_seconds)}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                  ),
                ),
              ),
              baseColor: Color.fromRGBO(255, 255, 255, .2),
              selectionColor: Colors.white,
              onSelectionEnd: (init, end, laps) {
                setState(() {
                  if (end % 5 == 0 && end > 0) {
                    _minutes = end;
                    selectedMinute.workingTime = _minutes;
                  }
                });
              },
              onSelectionChange: (init, end, laps) {
                setState(() {
                  if (end % 5 == 0 && end > 0) {
                    _minutes = end;
                    selectedMinute.workingTime = _minutes;
                  }
                });
              },
            ),
            SizedBox(
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
//                    Navigate to next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TimerScreen()),
                    );
                  },
                  color: Colors.green[400],
                  shape: CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 40, bottom: 40, left: 10, right: 10),
                    child: Text(
                      "Start",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
