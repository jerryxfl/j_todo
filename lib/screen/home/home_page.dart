import 'package:flutter/material.dart';
import 'package:jerry_todo/provider/task_provider.dart';
import 'package:jerry_todo/screen/home/component/top_content.dart';
import 'package:provider/provider.dart';

import 'component/bottom_content.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    Provider.of<TaskListProvider>(context,listen: false).initTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(child: TopContentWidget(),flex: 1,),
            Expanded(child: BottomContentWidget(),flex: 1,),
          ],
        ),
      ),
    );
  }
}


