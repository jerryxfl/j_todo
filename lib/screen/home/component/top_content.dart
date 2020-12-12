import 'dart:ui';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jerry_todo/bean/task.dart';
import 'package:jerry_todo/bean/todo.dart';
import 'package:jerry_todo/utils/constants.dart';
import 'package:jerry_todo/utils/datas.dart';
import 'package:jerry_todo/utils/date_utils.dart';

class TopContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Constants.homeTopBackgroundColor,
              child: SafeArea(child: UserInfoWidget()),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              child: UserTasksListWidget(),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}

//用户基本信息widget
class UserInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Row(children: [
                            Text(
                              "Hi,",
                              style: TextStyle(
                                  color: Constants.homeTopTextColor1,
                                  fontSize: 25),
                            ),
                            Text(
                              " Zara",
                              style: TextStyle(
                                  color: Constants.homeTopTextColor2,
                                  fontSize: 25),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              Text(
                                "You have",
                                style: TextStyle(
                                    color: Constants.homeTopTextColor1,
                                    fontSize: 18),
                              ),
                              Text(
                                " 5 ",
                                style: TextStyle(
                                  color: Constants.homeTopTextColor2,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "targets,",
                                style: TextStyle(
                                    color: Constants.homeTopTextColor1,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        )
                      ]),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Icon(
                            FontAwesomeIcons.solidBell,
                            color: Colors.white,
                            size: 20,
                          ),
                          Positioned(
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: Colors.green, shape: BoxShape.circle),
                            ),
                            right: 0,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 55,
                        width: 55,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(Constants.userAvatar),
                          backgroundColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Targets",
                    style: TextStyle(
                        color: Constants.homeTopTextColor2,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        wordSpacing: 10),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Constants.chipBorderColor, width: 2)),
                    child: Icon(
                      FontAwesomeIcons.chevronRight,
                      color: Colors.white,
                      size: 10,
                    ),
                  )
                ],
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}

//用户基本任务列表
class UserTasksListWidget extends StatefulWidget {
  @override
  _UserTasksListWidgetState createState() => _UserTasksListWidgetState();
}

class _UserTasksListWidgetState extends State<UserTasksListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Constants.homeTopBackgroundColor,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Constants.homeBottomBackgroundColor,
                ),
              ),
            ],
          ),
          Container(
            child: ListView.builder(
              itemBuilder: _itemBuilder,
              itemCount: tasks.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
            ),
          )
        ],
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      width: size.width / 1.2,
      child: Column(children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(tasks[index].icon),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tasks[index].title,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                          Text(
                            "${getTasksTodoSize(tasks[index])} todo",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ]),
                  ]),
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.ellipsisH,
                        color: Colors.black,
                        size: 18,
                      ),
                      onPressed: () {})
                ]),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 1,
                color: Colors.grey[400],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Icon(
                              FontAwesomeIcons.calendarAlt,
                              color: Colors.grey[400],
                              size: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              DateUtils.stampToDate(tasks[index].time),
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 15,
                              ),
                            )
                          ]),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffFCD4D9)),
                        child: Text(
                          "Priority",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.w800),
                        ),
                      )
                    ],
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Progress",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[400],
                              )),
                          Text("${calculateTaskProgressStr(tasks[index])}%",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              )),
                        ]),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:20),
                    child: LinearProgressIndicator(value: calculateTaskProgress(tasks[index]),backgroundColor: Color(0xffF1F1F2),minHeight: 10,),
                  )
                ]),
                flex: 2,
              ),
            ]),
          ),
          flex: 2,
        ),
      ]),
    );
  }

  //获得每个任务有多少个todo
  int getTasksTodoSize(Task task) {
    int count = 0;
    todos.forEach((element) {
      if (element.taskId == task.id) count++;
    });
    return count;
  }


  //计算task完成进度
  double calculateTaskProgress(Task task){
    //todo总数量
    int totalTodo = getTasksTodoSize(task);

    int completeSum = getTodoCompleteSum(task);

    if(totalTodo == 0){
      return 1;
    }else{
      return completeSum/totalTodo;
    }
  }

  String calculateTaskProgressStr(Task task){
    double progress = calculateTaskProgress(task);
    return NumUtil.getNumByValueDouble(progress*100, 0).toString();
  }

  //计算todo完成数量
  int getTodoCompleteSum(Task task){
    List<Todo> completeTodo = [];
    todos.forEach((element) {
      if(element.taskId == task.id){
        completeTodo.add(element);
      }
    });

    int completeSum = 0;
    completeTodo.forEach((element) {
      if(element.isDone){
        completeSum++;
      }
    });

    return completeSum;
  }
}
