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
  List<Task> _wisdomList = [
    Task(name: 'Learn to code'),
    Task(name: 'Read books'),
    Task(name: 'Apply what you learned')
  ];
  List<Task> _loveList = [
    Task(name: 'Spend more time together'),
    Task(name: 'Call Dad and Mom'),
    Task(name: 'Play game with friends')
  ];
  List<Task> _healthList = [
    Task(name: 'Exercise'),
    Task(name: 'Sleep early'),
    Task(name: 'Drink water')
  ];
  List<Task> _happinessList = [
    Task(name: 'Play guitar'),
    Task(name: 'Go to Yosemite'),
    Task(name: 'Learn how to cook')
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  UnmodifiableListView<Task> get wealthTask {
    return UnmodifiableListView(_wealthList);
  }

  UnmodifiableListView<Task> get wisdomTask {
    return UnmodifiableListView(_wisdomList);
  }

  UnmodifiableListView<Task> get loveTask {
    return UnmodifiableListView(_loveList);
  }

  UnmodifiableListView<Task> get healthTask {
    return UnmodifiableListView(_healthList);
  }

  UnmodifiableListView<Task> get happinessTask {
    return UnmodifiableListView(_happinessList);
  }

  int taskCount(List<Task> currentList) {
    return currentList.length;
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

  void deleteWealthTask(Task task) {
    _wealthList.remove(task);
    notifyListeners();
  }

  void deleteWisdomTask(Task task) {
    _wisdomList.remove(task);
    notifyListeners();
  }

  void deleteLoveTask(Task task) {
    _loveList.remove(task);
    notifyListeners();
  }

  void deleteHealthTask(Task task) {
    _healthList.remove(task);
    notifyListeners();
  }

  void deleteHappinessTask(Task task) {
    _happinessList.remove(task);
    notifyListeners();
  }
}
