import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/task/usecases/add_task.dart';
import '../../../domain/task/usecases/delete_task.dart';
import '../../../domain/task/usecases/get_tasks.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTasks getTasks;
  final AddTask addTask;
  final DeleteTask deleteTask;

  TaskBloc(
      {required this.getTasks, required this.addTask, required this.deleteTask})
      : super(TaskInitial()) {
    on<LoadTasks>((event, emit) async{
      final tasks = await getTasks();
      emit(TaskLoaded(tasks));
    });

    on<AddNewTask>((event, emit) async{
      await addTask(event.task);
      final tasks = await getTasks();
      emit(TaskLoaded(tasks));
    });

    on<DeleteTaskEvent>((event, emit) async{
      await deleteTask(event.id);
      final tasks = await getTasks();
      emit(TaskLoaded(tasks));
    });
  }
}
