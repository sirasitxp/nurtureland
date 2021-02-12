import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}


class _TimerScreenState extends State<TimerScreen> {
  Color gradientStart = Colors.green[300];
  Color gradientEnd = Colors.yellow[200];
  int _seconds = 00;
  int _minutes = 25;
  int selectedMinute = 25;
  Timer _timer;
  var f = NumberFormat("00");

  void _stopTimer() {
    if (_timer != null) {
      _timer.cancel();
      _seconds = 0;
      _minutes = selectedMinute;
    }
  }

  void _startTimer() {
    if (_timer != null) {
      _stopTimer();
    }
    if (_minutes > 0) {
      _seconds = _minutes * 60;
    }
    if (_seconds > 60) {
      _minutes = (_seconds / 60).floor();
      _seconds -= (_minutes * 60);
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          if (_minutes > 0) {
            _seconds = 59;
            _minutes--;
          } else {
            _timer.cancel();
            print("Timer Complete");
            _minutes = selectedMinute;
          }
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
        ),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
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
            Center(
              child: Text(
                "${f.format(_minutes)} : ${f.format(_seconds)}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _stopTimer();
                      _startTimer();
                    });
                  },
                  color: Colors.black,
                  shape: CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30, bottom: 30, left: 10, right: 10),
                    child: Text(
                      "Restart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    _startTimer();
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
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _stopTimer();
                    });
                  },
                  color: Colors.white,
                  shape: CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30, bottom: 30, left: 10, right: 10),
                    child: Text(
                      "Stop",
                      style: TextStyle(
                        color: Colors.green[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
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
