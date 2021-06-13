import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Get Sh*t done",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            decoration: (selected) ? TextDecoration.lineThrough : null),
      ),
      leading: RoundCheckBox(
        onTap: (selected) {
          this.setState(() {
            this.selected = !this.selected;
          });
        },
        borderColor: Colors.black12,
        isChecked: true,
        size: 30,
      ),
    );
  }
}

// CircularCheckBox(
// value: this.selected,
// checkColor: Colors.black,
// activeColor: Colors.green,
// inactiveColor: Colors.grey,
// disabledColor: Colors.green,
// onChanged: (val) {
// this.setState(() {
// this.selected = !this.selected;
// });
// },
// ),
