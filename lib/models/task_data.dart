import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:nurtureland/Models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Go to the gym'),
    Task(name: 'Read books'),
    Task(name: 'Code'),
  ];

  List<Task> _wealthList = [];
  List<Task> _wisdomList = [];
  List<Task> _loveList = [];
  List<Task> _healthList = [];
  List<Task> _happinessList = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle, List<Task> list) {
    final task = Task(
      name: newTaskTitle,
    );
    list.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
