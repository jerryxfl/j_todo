import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jerry_todo/bean/task.dart';
import 'package:jerry_todo/provider/task_provider.dart';
import 'package:jerry_todo/utils/SqliteHelper.dart';
import 'package:jerry_todo/utils/constants.dart';
import 'package:jerry_todo/utils/datas.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  Task newTask;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: WillPopScope(
        onWillPop: () async {
          if (newTask != null)
            Provider.of<TaskListProvider>(context, listen: false)
                .addTask(newTask);
          return true;
        },
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Constants.homeTopBackgroundColor,
                  child: SafeArea(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Provider.of<TaskListProvider>(context,
                                          listen: false)
                                      .addTask(newTask);
                                  Navigator.pop(context);
                                },
                                child: Icon(FontAwesomeIcons.chevronLeft)),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                hintText: "New Task",
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                if (newTask == null) {
                                  newTask = Task(
                                      id: tasks.length,
                                      icon: Constants.taskDefaultIcon,
                                      title: value,
                                      time:
                                          DateTime.now().microsecondsSinceEpoch,
                                      isDone: false);
                                }
                                newTask.title = value;
                              },
                                  onSubmitted: (value){
                                    SqliteHelper sqliteHelper = SqliteHelper();
                                    sqliteHelper.addTask(newTask);
                                  },
                            ))
                          ]),
                    ),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(),
                flex: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
