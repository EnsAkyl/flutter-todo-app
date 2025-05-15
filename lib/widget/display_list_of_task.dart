import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 3, left: 15),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: task.category.color.withOpacity(0.2),
                            border: Border.all(
                              width: 2.5,
                              color: task.category.color,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              task.category.icon,
                              color: task.category.color,
                            ),
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [Text(task.title), Text(task.date)],
                          ),
                        ),
                        Checkbox(
                          value: isCompletedTasks,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(thickness: 1.5);
                },
              ),
    );
  }
}
