import '../../../data/models/task_model.dart';
import '../entities/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();

  Future<void> addTask(Task task);

  Future<void> deleteTask(int id);
}
