import 'package:flutter/cupertino.dart';

class Task {
  int id;
  String icon;
  String title;
  int time;
  bool isDone;

  Task(
      {@required this.id,
      @required this.icon,
      @required this.title,
      @required this.time,
      @required this.isDone});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    title = json['title'];
    time = json['time'];
    isDone = json['isDone'] == 1 ? true : false;
  }

  Map<String, dynamic> toJson(){
    return {
      "id":id,
      "icon":icon,
      "title":title,
      "time":time,
      "isDone":isDone?1:0,
    };
  }
}
