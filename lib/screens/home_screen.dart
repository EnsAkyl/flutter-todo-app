import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widget/common_container.dart';
import 'package:todo_app/widget/display_white_text.dart';

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
                        text: "Yo Do Uygulaman",
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
            top: 155,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CommonContainer(
                    child: ListView.builder(
                      itemCount: 8,
                      padding: EdgeInsets.all(2),
                      itemBuilder: (ctx, index) {
                        return Text("Şunu yap bunu yap");
                      },
                    ),
                  ),
                  const Gap(15),
                  Text(
                    "Tamamlanan Yo Do'lar",
                    style: context.textTheme.headlineMedium,
                  ),
                  const Gap(15),

                  CommonContainer(
                    child: ListView.builder(
                      itemCount: 8,
                      padding: EdgeInsets.zero,
                      itemBuilder: (ctx, index) {
                        return Text("Şunu yap bunu yap");
                      },
                    ),
                  ),

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
        ],
      ),
    );
  }
}
