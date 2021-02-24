import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/widgets/task_item.dart';
import 'package:todoey/screens/addtask_screen.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  final List<Task> taskList = [];
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  int activeCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(
          Icons.add,
          size: 50,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTask(addTaskCallback: (name) {
              setState(() {
                widget.taskList.add(Task(name));
                widget.taskList.forEach((element) {
                  if (element.isCompleted == true) activeCount++;
                });
              });
              Navigator.pop(context);
            }),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RawMaterialButton(
                  onPressed: () {},
                  constraints: BoxConstraints.tightFor(width: 60, height: 60),
                  fillColor: Colors.white,
                  highlightColor: Colors.lightBlueAccent,
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'ToDoey',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 50),
                ),
                Text(
                  '$activeCount of ${widget.taskList.length} tasks completed.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: kBoxDecoration,
              child: TasksList(widget.taskList),
            ),
          )
        ],
      ),
    );
  }
}
