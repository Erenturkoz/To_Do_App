import 'package:todo_app/constants/tasktype.dart';

class Task {
  Task({
    required this.type,
    required this.title,
    required this.decription,
    required this.isComplated,
  });

  final Tasktype type;
  final String title;
  final String decription;
  bool isComplated;
}
