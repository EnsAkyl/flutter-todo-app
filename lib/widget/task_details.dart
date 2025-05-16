import 'package:flutter/material.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/widget/widget.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          CircleContaniner(
            color: task.category.color.withOpacity(0.3),
            child: Icon(task.category.icon),
          ),
        ],
      ),
    );
  }
}
