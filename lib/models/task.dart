import 'package:flutter/cupertino.dart';

class Task {
  String name;
  bool isDone;
  int id;

  Task({
    this.name,
    this.isDone = false,
    this.id,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}
