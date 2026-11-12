import 'package:get_it/get_it.dart';
import 'package:todolist_learn/data/repositories/todo_repository_impl.dart';
import 'package:todolist_learn/database/app_database.dart';
import 'package:todolist_learn/domain/repositories/todo_repository.dart';
import 'package:todolist_learn/domain/usecases/add_todo_use_case.dart';
import 'package:todolist_learn/domain/usecases/delete_todo_use_case.dart';
import 'package:todolist_learn/domain/usecases/fetch_todo_use_case.dart';
import 'package:todolist_learn/domain/usecases/update_todo_use_case.dart';
import 'package:todolist_learn/presentation/bloc/todo/todo_cubit.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(sl()));
  sl.registerLazySingleton(() => FetchTodoUseCase(sl()));
  sl.registerLazySingleton(() => AddTodoUseCase(sl()));
  sl.registerLazySingleton(() => DeleteTodoUseCase(sl()));
  sl.registerLazySingleton(() => UpdateTodoUseCase(sl()));
  sl.registerFactory(
    () => TodoCubit(
      fetchTodoUseCase: sl(),
      addTodoUseCase: sl(),
      deleteTodoUseCase: sl(),
      updateTodoUseCase: sl(),
    ),
  );
}
