import 'package:flutter/material.dart';
import 'package:skill_proficiency/skill_proficiency.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('等级选择器'),
        ),
        body: SkillProficiency<String>(
          levels: const [
            'Novice',
            'Beginner',
            'Skillful',
            'Experienced',
            // 'Expert',
          ], // 传入五个等级
          selectedIndex: 0, // 默认选中Skillful
          // isSelectable: false,
          levelNameBuilder: (e) => e,
          onSelected: (data){
            print(data.toString());
          },
        ),
      ),
    );
  }
}
