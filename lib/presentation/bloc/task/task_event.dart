import '../../../domain/task/entities/task.dart';

abstract class TaskEvent {}

class LoadTasks extends TaskEvent {}

class AddNewTask extends TaskEvent {
  final Task task;

  AddNewTask(this.task);
}

class DeleteTaskEvent extends TaskEvent {
  final int id;

  DeleteTaskEvent(this.id);
}
