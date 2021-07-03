import 'package:flutter/material.dart';
import 'package:nurtureland/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:nurtureland/models/task_data.dart';

class HappinessList extends StatefulWidget {
  @override
  _HappinessListState createState() => _HappinessListState();
}

class _HappinessListState extends State<HappinessList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.happinessTask[index];
            return Dismissible(
              background: Container(
                color: Colors.red,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        'Delete',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              key: Key(task.name),
              onDismissed: (direction) {
                // Remove the item from the data source.
                taskData.deleteHappinessTask(task);
              },
              child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkBoxCallback: (checkboxState) {
                  taskData.updateTask(task);
                },
              ),
            );
          },
          itemCount: taskData.taskCount(taskData.happinessTask),
        );
      },
    );
  }
}
