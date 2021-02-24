import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final Function addTaskCallback;
  AddTask({this.addTaskCallback});
  @override
  Widget build(BuildContext context) {
    String taskTitle;
    return Container(
      color: Color(0xFF757575),
      child: Container(
          decoration: kBoxDecoration.copyWith(color: Colors.white),
          padding: EdgeInsets.only(top: 10, left: 50, right: 50),
          child: Column(
            children: [
              Text(Provider.of(context),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 40,
                      color: Colors.lightBlueAccent)),
              TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: 'Enter task name'),
                controller: _controller,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  taskTitle = value;
                },
              ),
              SizedBox(height: 12),
              FlatButton(
                minWidth: double.infinity,
                height: 48,
                onPressed: () => addTaskCallback(taskTitle),
                child: Text('Add',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                color: Colors.lightBlueAccent,
              )
            ],
          )),
    );
  }
}
