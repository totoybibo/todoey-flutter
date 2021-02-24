import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:flutter/widgets.dart';
import 'package:todoey/widgets/task_item.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  TasksList(this.tasks);
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        Task task = widget.tasks[index];
        return TaskItem(
          title: task.name,
          isCompleted: task.isCompleted,
          checkBoxCallback: (value) {
            setState(() => widget.tasks[index].toggleCompleted());
          },
        );
      },
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
    );
  }
}
