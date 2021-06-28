import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallback;

  TaskTile({
    this.isChecked,
    this.taskTitle,
    this.checkBoxCallback,
  });

  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            decoration: (isChecked) ? TextDecoration.lineThrough : null),
      ),
      leading: RoundCheckBox(
        onTap: checkBoxCallback,
        borderColor: Colors.black12,
        isChecked: isChecked,
        size: 30,
        animationDuration: Duration(milliseconds: 0),
      ),
    );
  }
}
