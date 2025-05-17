import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/widget/display_white_text.dart';

class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      CreateTaskScreen();

  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DisplayWhiteText(
          text: "Yeni Görev Detayları",
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
