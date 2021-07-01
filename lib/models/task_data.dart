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

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle, int currentPage) {
    final task = Task(
      name: newTaskTitle,
    );
    if (currentPage == 0) {
      _wealthList.add(task);
    } else if (currentPage == 1) {
      _wisdomList.add(task);
    } else if (currentPage == 2) {
      _loveList.add(task);
    } else if (currentPage == 3) {
      _healthList.add(task);
    } else {
      _happinessList.add(task);
    }
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
