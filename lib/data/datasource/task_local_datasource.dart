import 'dart:convert';

import 'package:task/core/helpers/app_storage.dart';

import '../../domain/task/entities/task.dart';
import '../models/task_model.dart';

class TaskLocalDataSource {
  final List<Task> _tasks = [];
  Future<List<TaskModel>> getTasks() async{
    final String jsonString = AppStorage.getTasks;

    if (jsonString.isNotEmpty) {
      final List<dynamic> decoded = json.decode(jsonString);
      return decoded.map((item) => TaskModel.fromJson(item)).toList();
    } else {
      return [];
    }
  }
  Future<void> addTask(TaskModel task) async {
    final List<TaskModel> currentTasks = await getTasks();
    currentTasks.add(task);
    final List<Map<String, dynamic>> jsonTasks = currentTasks.map((t) => t.toJson()).toList();
    AppStorage.addTask(json.encode(jsonTasks));
  }
  Future<void> deleteTask(int id) async {
    final tasks = await getTasks();
    tasks.removeWhere((t) => t.id == id,);
    AppStorage.addTask(json.encode(tasks));
  }
}