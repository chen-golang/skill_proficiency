import 'package:flutter/material.dart';
import 'package:skill_proficiency/skill_proficiency.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('等级选择器'),
        ),
        body: const Center(
          child: SizedBox(
            width: 370, // 设置宽度
            height: 60, // 设置高度
            child: SkillProficiency(
              levels: [
                'Novice',
                'Beginner',
                'Skillful',
                'Experienced',
                // 'Expert',
              ], // 传入五个等级
              selectedIndex: 0, // 默认选中Skillful
              isSelectable: false,
            ),
          ),
        ),
      ),
    );
  }
}
