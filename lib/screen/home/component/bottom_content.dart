import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jerry_todo/bean/task.dart';
import 'package:jerry_todo/bean/todo.dart';
import 'package:jerry_todo/provider/task_provider.dart';
import 'package:jerry_todo/provider/todo_provider.dart';
import 'package:jerry_todo/route/Routes.dart';
import 'package:jerry_todo/screen/task/task_page.dart';
import 'package:jerry_todo/utils/constants.dart';
import 'package:jerry_todo/utils/datas.dart';
import 'package:jerry_todo/utils/date_utils.dart';
import 'package:provider/provider.dart';

class BottomContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.homeBottomBackgroundColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tasks Priority",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                  ),
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.ellipsisH,
                        color: Colors.black,
                        size: 18,
                      ),
                      onPressed: () {})
                ]),
          ),
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  TaskListWidget(),
                  Positioned(
                    child: AddNewTaskWidget(),
                    bottom: 20,
                    right: 20,
                  )
                ],
              ),
            ),
            flex: 6,
          ),
        ],
      ),
    );
  }
}

//添加新tasks
class AddNewTaskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //添加新的task
        Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 200),
            pageBuilder: (context, animation, secondaryAnimation) {
              return TaskPage();
            },
            transitionsBuilder:  (BuildContext context, Animation<double> animation1, Animation<double> animation2, Widget child){
              return ScaleTransition(
                alignment: Alignment.bottomRight,
                scale: Tween(
                    begin: 0.0,
                    end:1.0).animate(
                    CurvedAnimation(
                        curve: Curves.ease,
                        parent: animation1)),
                child: child,);
            }
        ));
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff09CEDB),
            boxShadow: [BoxShadow(color: Color(0xff09CEDB), blurRadius: 5)]),
        child: Icon(
          FontAwesomeIcons.plus,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

//任务内容
class TaskListWidget extends StatefulWidget {
  @override
  _TaskListWidgetState createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => _taskItemBuilder(context,
          Provider.of<TaskListProvider>(context).taskList[index], index),
      itemCount: Provider.of<TaskListProvider>(context).taskList.length,
      physics: BouncingScrollPhysics(),
    );
  }

  Widget _taskItemBuilder(BuildContext context, Task task, int index) {
    return Container(
      height: 130.0 +
          Provider.of<TodoListProvider>(context).getTodoList(task).length *
              60.0,
      margin: EdgeInsets.only(
          left: 20, right: 20, top: index == 0 ? 0 : 10, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.9)),
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(tasks[index].icon),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(tasks[index].title.length>15?"${tasks[index].title.substring(0,15)}...":tasks[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.chevronUp,
                        color: Colors.black,
                        size: 18,
                      ),
                      onPressed: () {})
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              height: 1,
              color: Colors.grey[400]),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  //todos
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemBuilder: (context, index) => _todoItemBuild(
                            context,
                            Provider.of<TodoListProvider>(context)
                                .getTodoList(task)[index]),
                        itemCount: Provider.of<TodoListProvider>(context)
                            .getTodoList(task)
                            .length,
                        physics: NeverScrollableScrollPhysics(),
                      ),
                    ),
                  ),
                  //addTodos
                  GestureDetector(
                    onTap: () {
                      //添加新的todo
                      Provider.of<TodoListProvider>(context, listen: false)
                          .addTodo(Todo(
                              id: todos.length,
                              taskId: task.id,
                              content: "New Todo",
                              isDone: false,
                              startTime: DateTime.now().millisecondsSinceEpoch
                      ));
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: Colors.grey[400],
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add new todo",
                              style: TextStyle(
                                  color: Colors.grey[400], fontSize: 15),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2, color: Color(0xffF1BAC0))),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Constants.homeTopBackgroundColor,
                                size: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            flex: 4,
          ),
        ],
      ),
    );
  }

  Widget _todoItemBuild(BuildContext context, Todo todo) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(children: [
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  todo.content,
                  style: TextStyle(
                      color: !todo.isDone ? Colors.black : Colors.grey[500],
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "${DateUtils.stampToDay(todo.startTime)} --- ${todo.endTime == null ? DateUtils.stampToDay(todo.startTime) : DateUtils.stampToDay(todo.endTime)}",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ]),
          flex: 5,
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              todo.isDone = !todo.isDone;
              Provider.of<TodoListProvider>(context, listen: false)
                  .updateTodo(todo);
            },
            icon: Icon(
              todo.isDone
                  ? FontAwesomeIcons.solidCheckCircle
                  : FontAwesomeIcons.circle,
              color: todo.isDone
                  ? Constants.homeTopBackgroundColor
                  : Colors.grey[500],
            ),
          ),
          flex: 1,
        ),
      ]),
    );
  }
}
