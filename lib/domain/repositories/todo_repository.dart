import 'package:todolist_learn/core/result/result.dart';
import 'package:todolist_learn/domain/entities/todo_entity.dart';

abstract interface class TodoRepository {
  Future<Result<List<TodoEntity>>> getTodos();
  Future<Result<void>> saveTodo(TodoEntity todo);
  Future<Result<void>> deleteTodo(int id);
}
