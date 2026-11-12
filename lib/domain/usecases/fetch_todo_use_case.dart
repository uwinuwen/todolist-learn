import 'package:todolist_learn/core/result/result.dart';
import 'package:todolist_learn/domain/entities/todo_entity.dart';
import 'package:todolist_learn/domain/repositories/todo_repository.dart';

class FetchTodoUseCase(final TodoRepository repository) {
  Future<Result<List<TodoEntity>>> call() async {
    return repository.getTodos();
  }
}
