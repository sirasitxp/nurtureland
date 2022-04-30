import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:nurtureland/Models/minutes.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';
import 'package:nurtureland/screens/welcome_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nurtureland/main.dart';

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
    _seconds = _minutes * 60;
    _controller = CountDownController();
  }

  void setNotification() async {
    var scheduleNotificationDateTime = DateTime.now().add(Duration(seconds: 0));

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm Notification',
      icon: 'ic_launcher',
      largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Timer Complete',
        'Good Job! You are getting closer to your goals',
        scheduleNotificationDateTime,
        platformChannelSpecifics);
  }

  void cancel_timer() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Do you want to give up?'),
        content: Text(
            'Breaking the session would kill your current progress.'), // May be show a picture of your tree here
        actions: [
          TextButton(
              onPressed: () {
                print("Countdown Stopped");
                _controller.pause();
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Give up')),
          TextButton(
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
              child: const Text('Dismiss')),
        ],
      ),
    );
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
        onPressed: () {
          cancel_timer();
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
                width: MediaQuery.of(context).size.width / 1.25,
                height: MediaQuery.of(context).size.height / 3,
                fillColor: Colors.yellow[100],
                ringColor: Colors.white,
                backgroundColor: Colors.transparent,
                strokeWidth: 20.0,
                strokeCap: StrokeCap.round,
                textStyle: TextStyle(fontSize: 48.0, color: Colors.white),
                textFormat: (_minutes < 60)
                    ? CountdownTextFormat.MM_SS
                    : CountdownTextFormat.HH_MM_SS,
                isReverse: true,
                isReverseAnimation: true,
                isTimerTextShown: true,
                autoStart: true,
                onStart: () {
                  print('Countdown Started');
                },
                onComplete: () {
                  // set Notification here
                  setNotification();
                  print('Countdown Ended');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(2)),
                    // Add Popup here
                  );
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Session Complete'),
                      content: Text(
                          'You have grown 1 tree'), // May be show a picture of your tree here
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Add')),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 275,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: ImageSequenceAnimator(
                    "images/ImageSequences",
                    "Frame_",
                    0,
                    5,
                    "png",
                    6,
                    fps: (6 / selectedMinute.workingTime) / 60,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      cancel_timer();
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
