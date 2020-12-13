

import 'package:jerry_todo/bean/task.dart';
import 'package:jerry_todo/bean/todo.dart';


///任务数据
List<Task> tasks = [
  Task(id: 1, icon: "https://images.pexels.com/photos/3212378/pexels-photo-3212378.jpeg", title: "Learn UX Design", time: 1607783534000000, isDone: false),
  Task(id: 2, icon: "https://images.pexels.com/photos/5849016/pexels-photo-5849016.jpeg", title: "Learn UX Design2", time: 1607783534000000, isDone: false),
];



///todo数据
List<Todo> todos = [
  Todo(id: 1, taskId: 1, content: "New Todo1", isDone: false,startTime: 1607835583000000),
  Todo(id: 2, taskId: 1, content: "New Todo2", isDone: true,startTime: 1607835583000000),
  Todo(id: 3, taskId: 2, content: "New Todo1", isDone: true,startTime: 1607835583000000),
];