import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:nurtureland/Models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Go to the gym'),
    Task(name: 'Read books'),
    Task(name: 'Code'),
  ];

  List<Task> _wealthList = [
    Task(name: 'Make money'),
    Task(name: 'Read books'),
    Task(name: 'Invest')
  ];
  List<Task> _wisdomList = [];
  List<Task> _loveList = [];
  List<Task> _healthList = [];
  List<Task> _happinessList = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  UnmodifiableListView<Task> get wealthTask {
    return UnmodifiableListView(wealthTask);
  }

  UnmodifiableListView<Task> get wisdomTask {
    return UnmodifiableListView(wisdomTask);
  }

  UnmodifiableListView<Task> get loveTask {
    return UnmodifiableListView(loveTask);
  }

  UnmodifiableListView<Task> get healthTask {
    return UnmodifiableListView(healthTask);
  }

  UnmodifiableListView<Task> get happinessTask {
    return UnmodifiableListView(happinessTask);
  }

  int taskCount() {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(
      name: newTaskTitle,
    );
    _tasks.add(task);
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
