import 'package:flutter/material.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widget/widget.dart';

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
    isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emtyTaskMessage =
    isCompletedTasks
        ? 'Tamamlanmış bir Yo Do bulunmuyor.'
        : 'Yapılacak bir Yo Do bulunmuyor.';

    return CommonContainer(
      height: height,
      child:
      tasks.isEmpty
          ? Center(
        child: Text(
          emtyTaskMessage,
          style: context.textTheme.headlineSmall,
        ),
      )
          : ListView.separated(
        itemCount: tasks.length,
        itemBuilder: (ctx, index) {
          final task = tasks[index];
          return InkWell(
            onLongPress: () {
              //Yo Do Silme
            },
            onTap: () async {
              await showBottomSheet(context: context, builder: (ctx) {
                return  TaskDetails(task: task);
              });

              //Yo Do Detayları
            },
            child: TaskTile(task: task),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(thickness: 1.5);
        },
      ),
    );
  }
}
