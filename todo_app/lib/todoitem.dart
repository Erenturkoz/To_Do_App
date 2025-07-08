import 'package:flutter/material.dart';
import 'package:todo_app/Model/task.dart';
import 'package:todo_app/constants/tasktype.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({super.key, required this.task});
  final Task task;

  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.isComplated ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.task.type == Tasktype.note
                ? Image.asset("lib/assets/images/Category0.png")
                : widget.task.type == Tasktype.contest
                ? Image.asset("lib/assets/images/Category2.png")
                : Image.asset("lib/assets/images/Category1.png"),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(
                      decoration: widget.task.isComplated
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                  Text(
                    widget.task.decription,
                    style: TextStyle(
                      decoration: widget.task.isComplated
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) => {
                setState(() {
                  widget.task.isComplated = !widget.task.isComplated;
                  isChecked = val!;
                }),
              },
            ),
          ],
        ),
      ),
    );
  }
}
