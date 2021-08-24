import 'package:flutter/cupertino.dart';

class Task {
  String name;
  bool isDone;
  int id;
  DateTime dateTime;

  Task({
    this.name,
    this.isDone = false,
    this.id,
    this.dateTime,
  });

  void toggleDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    return ({
      'id': id,
      'name': name,
      'date': dateTime.toString(),
      'isDone': isDone.toString(),
    });
  }
}
