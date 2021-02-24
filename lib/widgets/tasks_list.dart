import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/tasks.dart';
import 'package:flutter/widgets.dart';
import 'package:todoey/widgets/task_item.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Tasks tasks = Provider.of<Tasks>(context);
    return Consumer<Tasks>(
      builder: (context, tasks, child) {
        return ListView.builder(
          itemCount: tasks.taskCount,
          itemBuilder: (context, index) {
            Task task = tasks.task(index);
            return TaskItem(
              onLongPress: () {
                tasks.removeTask(index);
              },
              title: task.name,
              isCompleted: task.isCompleted,
              checkBoxCallback: (value) {
                tasks.taskCompleted(index);
              },
            );
          },
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        );
      },
    );
  }
}
