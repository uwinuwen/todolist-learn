import 'package:todolist_learn/core/result/result.dart';
import 'package:todolist_learn/domain/entities/todo_entity.dart';
import 'package:todolist_learn/domain/repositories/todo_repository.dart';

class AddTodoUseCase(this.repository) {
  final TodoRepository repository;

  Future<Result<void>> call(TodoEntity todo) async {
    return repository.saveTodo(todo);
  }
}
