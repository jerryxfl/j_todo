import 'package:flutter/material.dart';
import 'package:jerry_todo/screen/home/home_page.dart';
import 'package:jerry_todo/screen/task/task_page.dart';

Map<String, WidgetBuilder> routes = {
  "/": (context) => HomePage(),
  "/task": (context) => TaskPage(),
};
