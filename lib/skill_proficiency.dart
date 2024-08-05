import 'package:flutter/material.dart';

class SkillProficiency extends StatefulWidget {
  final List<String> levels;
  final int selectedIndex;
  final bool isSelectable;

  const SkillProficiency({
    super.key,
    required this.levels,
    this.selectedIndex = 2,
    this.isSelectable = true,
  });

  @override
  State<SkillProficiency> createState() => _SkillProficiencyState();
}

class _SkillProficiencyState extends State<SkillProficiency> {
  late int _selectedLevel; // 默认选中Skillful

  @override
  void initState() {
    super.initState();
    _selectedLevel = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.levels.length, (index) {
            return Expanded(
                child : GestureDetector(
              onTap: widget.isSelectable
                  ? () {
                setState(() {
                  _selectedLevel = index;
                });
              }
                  : null,
              child: Container(
                margin: const EdgeInsets.all(3.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: _selectedLevel >= index
                      ? Colors.yellow[700]
                      : Colors.grey[300],
                ),
              ),
                ),
            );
          }),
        ),
        ),
        if (widget.isSelectable)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 0, right: 10),
              child: Text(
                widget.levels[_selectedLevel],
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
