import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final Function checkBoxCallback;
  final Function onLongPress;
  TaskItem(
      {this.title, this.isCompleted, this.checkBoxCallback, this.onLongPress});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
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
