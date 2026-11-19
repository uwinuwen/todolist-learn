import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todolist_learn/core/errors/app_error_message.dart';
import 'package:todolist_learn/core/result/result.dart';
import 'package:todolist_learn/domain/entities/todo_entity.dart';
import 'package:todolist_learn/domain/usecases/add_todo_use_case.dart';
import 'package:todolist_learn/domain/usecases/delete_todo_use_case.dart';
import 'package:todolist_learn/domain/usecases/fetch_todo_use_case.dart';
import 'package:todolist_learn/domain/usecases/update_todo_use_case.dart';

part 'todo_state.dart';
part 'todo_cubit.freezed.dart';

class TodoCubit({
  required final FetchTodoUseCase _fetchTodoUseCase,
  required final AddTodoUseCase _addTodoUseCase,
  required final DeleteTodoUseCase _deleteTodoUseCase,
  required final UpdateTodoUseCase _updateTodoUseCase,
}) extends Cubit<TodoState> {
  this : super(const TodoState.initial());

  Future<void> fetchTodos() async {
    emit(TodoState.loading());
    final todos = await _fetchTodoUseCase();
    todos.when(
      success: (todos) => emit(TodoState.loaded(todos)),
      failure: (error) => emit(TodoState.error(error.message)),
    );
  }

  Future<void> addTodo(String title) async {
    final newTodo = TodoEntity(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
    );
    final result = await _addTodoUseCase(newTodo);
    result.when(
      success: (_) => null,
      failure: (error) => emit(TodoState.error(error.message)),
    );
    await fetchTodos();
  }

  Future<void> deleteTodo(int id) async {
    final result = await _deleteTodoUseCase(id);
    result.when(
      success: (_) => null,
      failure: (error) => emit(TodoState.error(error.message)),
    );
    await fetchTodos();
  }

  Future<void> toggleTodo(TodoEntity todo) async {
    final result = await _updateTodoUseCase(todo);
    result.when(
      success: (_) => null,
      failure: (error) => emit(TodoState.error(error.message)),
    );
    await fetchTodos();
  }
}
