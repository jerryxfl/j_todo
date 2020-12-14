import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jerry_todo/provider/task_provider.dart';
import 'package:jerry_todo/provider/todo_provider.dart';
import 'package:jerry_todo/route/Routes.dart';
import 'package:jerry_todo/utils/SqliteHelper.dart';
import 'package:jerry_todo/utils/datas.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(RootApp());
}


class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SqliteHelper sqliteHelper = SqliteHelper();
    sqliteHelper.initDB();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>TaskListProvider(),),
        ChangeNotifierProvider(create: (_)=>TodoListProvider(todoList: todos),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: routes,
      ),
    );
  }
}
