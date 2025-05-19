import 'package:flutter/material.dart';

enum TaskCategories {
  education(Icons.school, Colors.cyan),
  health(Icons.favorite, Colors.redAccent),
  home(Icons.home, Colors.green),
  other(Icons.calendar_month, Colors.grey),
  work(Icons.work, Colors.orangeAccent),
  social(Icons.people, Colors.pink),
  personel(Icons.person, Colors.amber),
  shopping(Icons.shopping_bag, Colors.indigoAccent),
  travel(Icons.flight, Colors.teal),
  important(Icons.warning, Colors.red),
  remember(Icons.edit_note, Colors.purpleAccent);

  static TaskCategories stringToCategory(String name) {
    try {
      return TaskCategories.values.firstWhere(
        (category) => category.name == name,
      );
    } catch (e) {
      return TaskCategories.other;
    }
  }

  final IconData icon;
  final Color color;

  const TaskCategories(this.icon, this.color);
}
