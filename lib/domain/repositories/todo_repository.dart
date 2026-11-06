import 'package:todolist_learn/domain/entities/todo_entity.dart';

abstract interface class TodoRepository {
  Future<List<TodoEntity>> fetchTodos();
  Future<void> addTodo(TodoEntity todo);
  Future<void> deleteTodo(int id);
  Future<void> toggleStatus(int id, bool isCompleted);
}
