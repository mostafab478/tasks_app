import 'package:task/data/datasource/task_local_datasource.dart';

import '../../domain/task/entities/task.dart';
import '../../domain/task/repositories/task_repository.dart';
import '../models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;
  TaskRepositoryImpl(this.localDataSource);
  @override
  Future<void> addTask(Task task) async {
    final model = TaskModel.fromEntity(task);
    await localDataSource.addTask(model);
  }

  @override
  Future<void> deleteTask(int id) async=> await localDataSource.deleteTask(id);

  @override
  Future<List<Task>> getTasks() async{
    final taskModels = await localDataSource.getTasks();
    return taskModels.map((model) => model.toEntity()).toList();
  }

}