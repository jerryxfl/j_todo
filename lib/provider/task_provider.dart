import 'package:flutter/material.dart';
import 'package:jerry_todo/bean/task.dart';
import 'package:jerry_todo/utils/SqliteHelper.dart';
import 'package:jerry_todo/utils/datas.dart';

class TaskListProvider extends ChangeNotifier{
  List<Task> taskList;

  TaskListProvider({this.taskList});


  void initTaskList(){
    taskList = [];
    SqliteHelper sqliteHelper = SqliteHelper();
    sqliteHelper.getTasks().then((value) => taskList);
  }

  void addTask(Task task){
    taskList.add(task);
    notifyListeners();
  }

  void deleteTask(Task task){
    taskList.forEach((element) {
      if(element.id == task.id){
        taskList.remove(element);
      }
    });
    notifyListeners();
  }

  void updateTask(Task task){
    taskList.forEach((element) {
      if(element.id == task.id){
        element.isDone = task.isDone;
        element.title = task.title;
        element.time = task.time;
        element.icon = task.icon;
      }
    });

    notifyListeners();
  }

}