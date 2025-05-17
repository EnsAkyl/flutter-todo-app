import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widget/widget.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          CircleContaniner(
            color: task.category.color.withOpacity(0.3),
            child: Icon(task.category.icon),
          ),

          const Gap(15),

          Text(
            task.title,
            style: style.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(task.time, style: style.titleMedium),

          Text(task.date, style: style.titleMedium),

          const Gap(10),

          Visibility(
            visible: !task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${task.date} tarihinde yapılacak görevin."),
                const SizedBox(width: 8),
                Icon(Icons.access_alarm, color: task.category.color),
              ],
            ),
          ),
          Divider(thickness: 1.5, color: task.category.color),
          const Gap(10),
          Text(
            task.note.isEmpty ? 'Bu göreve bir açıklama yapılmadı.' : task.note,
          ),
          Visibility(
            visible: task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Görev Tamamlandı."),
                const SizedBox(width: 8),
                Icon(Icons.check_box, color: task.category.color),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
