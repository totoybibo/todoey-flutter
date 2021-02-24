import 'dart:ffi';

import 'task.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

class Tasks extends ChangeNotifier {
  int activeTasks = 0;
  List<Task> _data = [Task('Buy Milk'), Task('Dont buy milk')];
  void addTask(String name) {
    _data.add(Task(name));
    notifyListeners();
  }

  void removeTask(int index) {
    _data.removeAt(index);
    notifyListeners();
  }

  void taskCompleted(int index) {
    _data[index].toggleCompleted();
    int cnt = 0;
    _data.forEach((element) {
      if (element.isCompleted == true) cnt++;
    });
    activeTasks = cnt;
    notifyListeners();
  }

  int get activeCount {
    int cnt = 0;
    _data.forEach((element) {
      if (element.isCompleted == false) cnt++;
    });
    return cnt;
  }

  Task task(int index) {
    return _data[index];
    notifyListeners();
  }

  UnmodifiableListView<Task> get data {
    return _data;
  }

  int get taskCount {
    return _data.length;
  }
}
