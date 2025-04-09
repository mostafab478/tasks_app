import 'package:get_it/get_it.dart';
import '../data/datasource/task_local_datasource.dart';
import '../data/repositories/task_repository_impl.dart';
import '../domain/task/repositories/task_repository.dart';
import '../domain/task/usecases/add_task.dart';
import '../domain/task/usecases/delete_task.dart';
import '../domain/task/usecases/get_tasks.dart';
import '../presentation/bloc/task/task_bloc.dart';

final sl = GetIt.instance;

void init() {
  // Data Source
  sl.registerLazySingleton(() => TaskLocalDataSource());

  // Repository
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetTasks(sl()));
  sl.registerLazySingleton(() => AddTask(sl()));
  sl.registerLazySingleton(() => DeleteTask(sl()));

  // Bloc
  sl.registerFactory(() => TaskBloc(
    getTasks: sl(),
    addTask: sl(),
    deleteTask: sl(),
  ));
}