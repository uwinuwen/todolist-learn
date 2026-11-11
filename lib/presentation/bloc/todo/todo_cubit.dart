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

class TodoCubit(
  super.initialState, {
  required this._fetchTodoUseCase,
  required this._addTodoUseCase,
  required this._deleteTodoUseCase,
  required this._updateTodoUseCase,
}) extends Cubit<TodoState> {
  final FetchTodoUseCase _fetchTodoUseCase;
  final AddTodoUseCase _addTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;

  void loading() {
    TodoState.loading();
  }

  void fetchTodos() async {
    final todos = await _fetchTodoUseCase();
    todos.when(
      success: (todos) => TodoState.loaded(todos),
      failure: (error) => TodoState.error(error.message),
    );
  }

  void addTodo(String title) async {
    final newTodo = TodoEntity(title: title);
    final result = await _addTodoUseCase(newTodo);
    result.when(
      success: (_) => null,
      failure: (error) => TodoState.error(error.message),
    );
    fetchTodos();
  }

  void deleteTodo(int id) async {
    final result = await _deleteTodoUseCase(id);
    result.when(
      success: (_) => null,
      failure: (error) => TodoState.error(error.message),
    );
    fetchTodos();
  }

  void toggleTodo(TodoEntity todo) async {
    final result = await _addTodoUseCase(todo);
    result.when(
      success: (_) => null,
      failure: (error) => TodoState.error(error.message),
    );
    fetchTodos();
  }
}
