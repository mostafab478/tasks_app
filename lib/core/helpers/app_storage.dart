import 'package:get_storage/get_storage.dart';

import '../../domain/task/entities/task.dart';

class AppStorage {
  static final GetStorage _box = GetStorage();

  static Future<void> init() async => await GetStorage.init();
  // Get tasks
  static String get getTasks => _box.read('addTask') ?? "";
  // Add new task
  static void addTask(String tasks) => _box.write('addTask', tasks);

}
