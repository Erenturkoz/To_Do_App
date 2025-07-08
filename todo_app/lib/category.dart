import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';

class Categorys extends StatefulWidget {
  const Categorys({
    super.key,
    required this.num,
    required this.taskType,
    required this.onSelected,
  });
  final int num;
  final Tasktype taskType;
  final Function(Tasktype) onSelected;

  @override
  State<Categorys> createState() => _CategorysState();
}

class _CategorysState extends State<Categorys> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected(widget.taskType);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Category Selected"),
            duration: Duration(milliseconds: 300),
          ),
        );
      },
      child: Image.asset(
        "lib/assets/images/Category${widget.num}.png",
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
    );
  }
}
