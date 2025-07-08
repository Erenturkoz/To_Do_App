import 'package:flutter/material.dart';
import 'package:todo_app/Model/task.dart';
import 'package:todo_app/category.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/date.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Tasktype taskType = Tasktype.note;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: deviceHeight / 10,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/header.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Başlık (Ortalanmış)
                    Text(
                      "Add New Task",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                    // Sol üstte kapatma butonu
                    Positioned(
                      left: 0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                          ); // ya da onPressed boş bırakılabilir
                        },
                        icon: Icon(Icons.close, size: 40, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("Task Title"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Category"),
                    Categorys(
                      num: 0,
                      taskType: Tasktype.note,
                      onSelected: (selectedType) {
                        setState(() {
                          taskType = selectedType;
                        });
                      },
                    ),
                    Categorys(
                      num: 1,
                      taskType: Tasktype.calender,
                      onSelected: (selectedType) {
                        setState(() {
                          taskType = selectedType;
                        });
                      },
                    ),
                    Categorys(
                      num: 2,
                      taskType: Tasktype.contest,
                      onSelected: (selectedType) {
                        setState(() {
                          taskType = selectedType;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Date(date: "Date", controller: dateController),
                  Date(date: "Time", controller: timeController),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("Description"),
              ),
              SizedBox(
                height: 300,
                child: TextField(
                  controller: descriptionController,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    isDense: true,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Task newTask = Task(
                    type: taskType,
                    title: titleController.text,
                    decription: descriptionController.text,
                    isComplated: false,
                  );
                  widget.addNewTask(newTask);
                  Navigator.pop(context);
                },
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
