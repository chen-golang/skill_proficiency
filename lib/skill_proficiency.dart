import 'package:flutter/material.dart';

typedef ChooseItemNameBuilder<T> = String Function(T data);

typedef ChooseItemSelected<T> = Function(T data);

class SkillProficiency<T> extends StatefulWidget {
  final List<T> levels;
  final int selectedIndex;
  final bool isSelectable;
  final Color? selectedColor;
  final Color? unselectedColor;
  final ChooseItemNameBuilder<T>? levelNameBuilder;
  final ChooseItemSelected<T>? onSelected;

  const SkillProficiency({
    super.key,
    required this.levels,
    this.selectedIndex = 2,
    this.isSelectable = true,
    this.levelNameBuilder,
    this.onSelected,
    this.selectedColor,
    this.unselectedColor,
  });

  @override
  State<SkillProficiency> createState() => _SkillProficiencyState<T>();
}

class _SkillProficiencyState<T> extends State<SkillProficiency<T>> {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.levels.length, (index) {
            return Expanded(
              child : GestureDetector(
                onTap: widget.isSelectable
                    ? () {
                  setState(() {
                    _selectedLevel = index;
                    if (widget.onSelected != null) {
                      widget.onSelected!(widget.levels[index]);
                    }
                  });
                }
                    : null,
                child: Container(
                  margin: const EdgeInsets.all(3.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: _selectedLevel >= index
                        ? widget.selectedColor ?? Colors.yellow[700]
                        : widget.unselectedColor ?? Colors.grey[300],
                  ),
                  child: const SizedBox(),
                ),
              ),
            );
          }),
        ),
        if (widget.isSelectable)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 0, right: 10),
              child: Text(
                widget.levelNameBuilder!(widget.levels[_selectedLevel]),
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
