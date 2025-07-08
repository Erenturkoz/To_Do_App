import 'package:flutter/material.dart';
import 'package:todo_app/Model/task.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/todoitem.dart';
import 'package:todo_app/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List<String> todo = ["Study Lesson", "Run 5K", "Go to Party"];
  //List<String> completed = ["Game meetup", "Take out trash"];

  List<Task> todo = [
    Task(
      type: Tasktype.note,
      title: "Study Lesson",
      decription: "Study",
      isComplated: false,
    ),
    Task(
      type: Tasktype.contest,
      title: "Run 5K",
      decription: "5kilometer run",
      isComplated: false,
    ),
    Task(
      type: Tasktype.calender,
      title: "Go to Party",
      decription: "Go to party",
      isComplated: false,
    ),
  ];
  List<Task> completed = [
    Task(
      type: Tasktype.contest,
      title: "Game Meetup",
      decription: "Game meetup",
      isComplated: false,
    ),
    Task(
      type: Tasktype.calender,
      title: "Take out trash",
      decription: "takeing the trash out",
      isComplated: false,
    ),
  ];

  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(backGround),
        body: Column(
          children: [
            //Header
            Container(
              width: deviceWidth,
              height: deviceHeight / 3 - 50,
              decoration: BoxDecoration(
                color: Colors.purple,
                image: DecorationImage(
                  image: AssetImage("lib/assets/images/header.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.only(top: 20.0),
                    child: Text(
                      "June 20, 2025",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.only(top: 40.0),
                    child: Text(
                      "My To Do List",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Top Column
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: todo.length,
                    itemBuilder: (context, index) {
                      return Todoitem(task: todo[index]);
                    },
                  ),
                ),
              ),
            ),
            // Complated text
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Complated",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
              ),
            ),
            //Bottom Column
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: completed.length,
                    itemBuilder: (context, index) {
                      return Todoitem(task: completed[index]);
                    },
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddNewTaskScreen(
                      addNewTask: (newTask) => addNewTask(newTask),
                    ),
                  ),
                );
              },
              child: Text("Add New Task"),
            ),
          ],
        ),
      ),
    );
  }
}
