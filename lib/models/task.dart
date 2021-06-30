class Task {
  String name;
  bool isDone;
  // String bucket; Add Later

  Task({this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}

// 0, Wealth Land
// 1, Wisdom Land
// 2, Love Land
// 3, Health Land
// 4, Happiness Land
