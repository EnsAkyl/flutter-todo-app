import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/config/routes/routes.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widget/widget.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);
    final completedTasks = _completedTasks(taskState.tasks, ref);
    final notCompletedTask = _notcompletedTasks(taskState.tasks, ref);
    final selectedDate = ref.watch(dateProvider);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.30,
                width: deviceSize.width,
                color: colors.primary,

                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => Helpers.selectDate(context, ref),
                        child: DisplayWhiteText(
                          text: DateFormat('dd MMMM yyyy').format(selectedDate),
                          fontSize: 20,
                        ),
                      ),
                      const Gap(5),
                      const DisplayWhiteText(
                        text: "Too Doo",
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListOfTask(tasks: completedTasks),

                    const Gap(15),

                    Text(
                      "Tamamlanan Too Doo'lar",
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(15),
                    DisplayListOfTask(
                      tasks: notCompletedTask,
                      isCompletedTasks: true,
                    ),

                    const Gap(15),

                    FilledButton(
                      onPressed: () => context.push(RouteLocation.createTask),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: DisplayWhiteText(
                          text: "Yeni Görev Belirle",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Task> _notcompletedTasks(List<Task> tasks, WidgetRef ref) {
    final List<Task> filteredTasks = [];
    final selectedDate = ref.watch(dateProvider);

    for (var task in tasks) {
      final isTaskDay = Helpers.isTaskFromSelectedDate(task, selectedDate);
      if (task.isCompleted && task.isCompleted) {
        filteredTasks.add(task);
      }
    }
    return filteredTasks;
  }

  List<Task> _completedTasks(List<Task> tasks, WidgetRef ref) {
    final List<Task> filteredTasks = [];
    final selectedDate = ref.watch(dateProvider);
    for (var task in tasks) {
      final isTaskDay = Helpers.isTaskFromSelectedDate(task, selectedDate);
      if (!task.isCompleted && isTaskDay) {
        filteredTasks.add(task);
      }
    }
    return filteredTasks;
  }
}
