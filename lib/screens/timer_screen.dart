import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:nurtureland/Models/minutes.dart';

class TimerScreen extends StatefulWidget {
  Minutes passedData;
  TimerScreen(@required this.passedData);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}


class _TimerScreenState extends State<TimerScreen> {
  Color gradientStart = Colors.green[300];
  Color gradientEnd = Colors.yellow[200];
  int _seconds = 00;
  int _minutes = 25;
  Minutes selectedMinute;
  CountDownController _controller;

  @override
  void initState() {
    super.initState();
    selectedMinute = Minutes(widget.passedData.workingTime);
    _minutes = selectedMinute.workingTime;
    _seconds = _minutes*60;
    _controller = CountDownController();
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
              child: CircularCountDownTimer(
                duration: _seconds,
                controller: _controller,
                width: MediaQuery.of(context).size.width /1.25,
                height: MediaQuery.of(context).size.height / 3,
                fillColor: Colors.yellow[100],
                ringColor: Colors.white,
                backgroundColor: Colors.transparent,
                strokeWidth: 20.0,
                strokeCap: StrokeCap.round,
                textStyle: TextStyle(
                    fontSize: 48.0, color: Colors.white),
                textFormat: (_minutes < 60) ?  CountdownTextFormat.MM_SS: CountdownTextFormat.HH_MM_SS,
                isReverse: true,
                isReverseAnimation: true,
                isTimerTextShown: true,
                autoStart: true,
                onStart: () {
                  print('Countdown Started');
                },
                onComplete: () {
                  print('Countdown Ended');
                },
              ),
            ),
            SizedBox(
              height: 275,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child:Image(
                      image: AssetImage('images/bare_tree.png'))
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _controller.pause();
                      Navigator.pop(context);
                    });
                  },
                  color: Colors.orange[300],
                  shape: CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 40, bottom: 40, left: 10, right: 10),
                    child: Text(
                      "Give up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
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
