
import 'package:flutter/cupertino.dart';

class Task{
  int id;
  String icon;
  String title;
  int time;
  bool isDone;

  Task({@required this.id,@required this.icon,@required this.title,@required this.time,@required this.isDone});
}
