

import 'package:flutter/cupertino.dart';

class Todo{
  int id;
  int taskId;
  int startTime;
  int endTime;
  String content;
  bool isDone;


  Todo({@required this.id,@required this.taskId,@required this.content,@required this.isDone,@required this.startTime,this.endTime});


}