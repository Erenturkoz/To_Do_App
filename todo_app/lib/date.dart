import 'package:flutter/material.dart';

class Date extends StatefulWidget {
  const Date({super.key, required this.date, required this.controller});
  final String date;
  final TextEditingController controller;

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(widget.date),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
