import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data.dart';
import '../providers.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepository _repository;

  TaskNotifier(this._repository) : super(const TaskState.initial()) {
    getTasks();
  }

  Future<void> createTask(Task task) async {
    try {
      await _repository.createTask(task);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final isComplete = !task.isCompleted;
      final updateTask = task.copyWith(isCompleted: isComplete);
      await _repository.updateTask(updateTask);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await _repository.deleteTask(task);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  void getTasks() async {
    try {
      final tasks = await _repository.getAllTasks();
      state = state.copyWith(tasks: tasks);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
