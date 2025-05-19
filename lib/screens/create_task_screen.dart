import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/config/routes/route_location.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/providers/date_provider.dart';
import 'package:todo_app/providers/providers.dart';
import 'package:todo_app/utils/app_alerts.dart';
import 'package:todo_app/utils/helpers.dart';
import 'package:todo_app/widget/select_date_time.dart';
import '../widget/widget.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      CreateTaskScreen();

  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                title: "Görev Tanımı",
                hintText: "Görev Tanımı Giriniz",
                controller: _titleController,
              ),
              const Gap(9),

              const SelectCategory(),

              const Gap(9),
              const SelectDateTime(),
              const Gap(9),
              CommonTextField(
                title: "Görev Açıklaması",
                hintText: "Görev Açıklaması Giriniz",
                maxLines: 7,
                controller: _noteController,
              ),
              const Gap(40),
              FilledButton(
                onPressed: () => _createTask(),
                child: const DisplayWhiteText(
                  text: "Yeni Görevi Ekle",
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createTask() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);

    if (title.isNotEmpty) {
      final task = Task(
        title: title,
        note: note,
        time: Helpers.timeToString(time),
        date: DateFormat('dd MMMM yyyy').format(date),
        category: category,
        isCompleted: false,
      );
      await ref.read(taskProvider.notifier).createTask(task).then((value) {
        AppAlerts.displaySnackBar(
          context,
          'Görev Başarılı Bir Şekilde Atanmıştır',
        );
        context.go(RouteLocation.home);
      });
    } else {
      AppAlerts.displaySnackBar(
        context,
        'Görev Tanımsız Devam Edemezsin',
      );
    }
  }
}
