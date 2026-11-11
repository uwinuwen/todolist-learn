import 'package:todolist_learn/core/result/result.dart';
import 'package:todolist_learn/domain/repositories/todo_repository.dart';

class DeleteTodoUseCase(final TodoRepository repository) {
  Future<Result<void>> call(int id) async {
    return repository.deleteTodo(id);
  }
}
