import 'package:todolist_learn/domain/entities/todo_entity.dart';
import 'package:todolist_learn/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  @override
  Future<void> addTodo(TodoEntity todo) async {}

  @override
  Future<void> deleteTodo(int id) async {}

  @override
  Future<List<TodoEntity>> fetchTodos() async {}

  @override
  Future<void> toggleStatus(int id, bool isCompleted) async {}
}
