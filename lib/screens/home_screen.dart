import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/utils/utils.dart';
import 'package:todo_app/widget/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final textFamily = context.textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.30,
                width: deviceSize.width,
                color: colors.primary,

                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DisplayWhiteText(text: "4 Nisan 2001", fontSize: 20),
                      Gap(10),
                      DisplayWhiteText(
                        text: "Yo Do",
                        fontSize: 35,
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
                    DisplayListOfTask(
                      tasks: [
                        Task(
                          title: "title",
                          note: "note",
                          time: "13.45",
                          date: "April",
                          isCompleted: false,
                          category: TaskCategories.important,
                        ),
                        Task(
                          title: "title2",
                          note: "note2",
                          time: "16.43",
                          date: "April",
                          isCompleted: false,
                          category: TaskCategories.remember,
                        ),
                      ],
                    ),

                    const Gap(15),

                    Text(
                      "Tamamlanan Yo Do'lar",
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(15),
                    DisplayListOfTask(tasks: [], isCompletedTasks: true),

                    const Gap(15),

                    FilledButton(
                      onPressed: () {},
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
}
