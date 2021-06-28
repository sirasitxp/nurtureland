class Task {
  String name;
  bool isDone;
  // String bucket; Add Later

  Task({this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
