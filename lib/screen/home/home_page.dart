import 'package:flutter/material.dart';
import 'package:jerry_todo/screen/home/component/top_content.dart';

import 'component/bottom_content.dart';

class HomePage extends StatelessWidget {
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


