import 'package:flutter/material.dart';
import 'package:jerry_todo/bean/task.dart';
import 'package:jerry_todo/bean/todo.dart';
import 'package:jerry_todo/utils/datas.dart';

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

}