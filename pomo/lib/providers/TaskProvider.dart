import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:pomo/services/database.dart';
import 'package:pomo/models/tasks.dart';
class TaskProvider extends ChangeNotifier{
  int noOfTasks=0;
  String pomo_count="1";
  //bool isSelected=false;
  //String taskName="";
  List<Task> _tasks= [];
  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }
  void saveData(Task newTask) {
    _tasks.add(newTask);
    //await DatabaseService().updateUserData(taskName, pomo_count);
    pomo_count="1";
    notifyListeners();

  }
  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
  void updateTask(Task  task){
    task.toggleDone();
    notifyListeners();
  }

  int get taskCount{
    return _tasks.length;
  }
}