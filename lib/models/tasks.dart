import 'task.dart';

class Tasks {
  List<Task> tasks;
  void add(Task task) {
    tasks.add(task);
  }

  List<Task> get list {
    return tasks ?? [];
  }

  int get count {
    return tasks.length ?? 0;
  }

  int get activeCount {
    int cnt = 0;
    tasks.forEach((element) {
      if (element.isCompleted == true) cnt++;
    });
    return cnt;
  }
}
