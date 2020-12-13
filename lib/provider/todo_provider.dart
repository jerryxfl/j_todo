import 'package:flutter/material.dart';
import 'package:jerry_todo/bean/task.dart';
import 'package:jerry_todo/bean/todo.dart';

class TodoListProvider extends ChangeNotifier{
  List<Todo> todoList;

  TodoListProvider({this.todoList});

  void addTodo(Todo todo){
    todoList.add(todo);
    notifyListeners();
  }

  void deleteTodo(Todo todo){
    todoList.forEach((element) {
      if(element.id == todo.id){
        todoList.remove(element);
      }
    });
    notifyListeners();
  }

  void updateTodo(Todo todo){
    todoList.forEach((element) {
      if(element.id == todo.id){
        element.isDone = todo.isDone;
        element.content = todo.content;
        element.startTime = todo.startTime;
        element.endTime = todo.endTime;
      }
    });

    notifyListeners();
  }

  List<Todo> getTodoList(Task task) {
    List<Todo> resultTodoList = [];

    todoList.forEach((element) {
      if(element.taskId == task.id){
        resultTodoList.add(element);
      }
    });
    return resultTodoList;
  }


  double calculateTaskProgress(Task task) {
    //todo总数量
    List<Todo> totalTodoList = getTodoList(task);

    int completeSum = 0;

    totalTodoList.forEach((element) {
      if(element.isDone)completeSum ++;
    });


    if (totalTodoList.length == 0) {
      return 1;
    } else {
      return completeSum / totalTodoList.length;
    }
  }
}