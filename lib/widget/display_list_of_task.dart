import 'package:flutter/material.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/utils/extensions.dart';
import 'common_container.dart';

class DisplayListOfTask extends StatelessWidget {
  const DisplayListOfTask({
    super.key,
    required this.tasks,
    this.isCompletedTasks = false,
  });

  final bool isCompletedTasks;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.35;
    return CommonContainer(
      height: height,
      child: ListView.builder(
        itemCount: tasks.length,
        padding: EdgeInsets.all(2),
        itemBuilder: (ctx, index) {
          return Text("Şunu yap bunu yap");
        },
      ),
    );
  }
}
