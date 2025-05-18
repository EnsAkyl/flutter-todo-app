import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../widget/widget.dart';

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
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CommonTextField(
              title: "Görev Tanımı",
              hintText: "Görev Tanımı Giriniz",
            ),
            const Gap(9),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    title: "Görev Tarih",
                    hintText: "18 Mayıs 2025",
                    readOnly: true,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.clock),
                    ),
                  ),
                ),
                const Gap(6),
                Expanded(
                  child: CommonTextField(
                    title: "Görev Saati",
                    hintText: "03:21",
                    readOnly: true,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.calendar),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(9),
            const CommonTextField(
              title: "Görev Açıklaması",
              hintText: "Görev Açıklaması Giriniz",
              maxLines: 7,
            ),
            const Gap(40),
            FilledButton(
              onPressed: () {},
              child: const DisplayWhiteText(
                text: "Yeni Görevi Ekle",
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
