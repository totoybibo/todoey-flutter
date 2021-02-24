import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final Function checkBoxCallback;
  TaskItem({this.title, this.isCompleted, this.checkBoxCallback});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          decoration:
              isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        focusColor: Colors.lightBlueAccent,
        activeColor: Colors.green,
        value: isCompleted,
        onChanged: checkBoxCallback,
      ),
    );
  }
}
