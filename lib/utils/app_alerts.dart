import 'package:flutter/material.dart';
import 'package:todo_app/utils/extensions.dart';

class AppAlerts {
  AppAlerts._();

  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: context.textTheme.bodyLarge?.copyWith(
          color: context.colorScheme.surface
        )),
        backgroundColor: context.colorScheme.primary,
      ),
    );
  }
}
