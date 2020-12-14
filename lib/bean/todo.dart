

import 'package:flutter/cupertino.dart';

class Todo{
  int id;
  int taskId;
  int startTime;
  int endTime;
  String content;
  bool isDone;


  Todo({@required this.id,@required this.taskId,@required this.content,@required this.isDone,@required this.startTime,this.endTime});


  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskId = json['taskId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    content = json['content'];
    isDone = json['isDone'] == 1 ? true : false;
  }

  Map<String, dynamic> toJson(){
    return {
      "id":id,
      "taskId":taskId,
      "startTime":startTime,
      "endTime":endTime,
      "content":content,
      "isDone":isDone,
    };
  }
}