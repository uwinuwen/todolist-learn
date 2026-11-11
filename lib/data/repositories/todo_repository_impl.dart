import 'package:drift/drift.dart';
import 'package:todolist_learn/core/errors/app_error_mapper.dart';
import 'package:todolist_learn/core/result/result.dart';
import 'package:todolist_learn/data/mappers/todo_companion_mapper.dart';
import 'package:todolist_learn/data/mappers/todo_entity_mapper.dart';
import 'package:todolist_learn/database/app_database.dart';
import 'package:todolist_learn/domain/entities/todo_entity.dart';
import 'package:todolist_learn/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl(this.db) implements TodoRepository {
  final AppDatabase db;

  @override
  Future<Result<void>> deleteTodo(int id) async {
    try {
      await (db.delete(db.todos)..where((tbl) => tbl.id.equals(id))).go();
      return Result.success(null);
    } catch (e) {
      return Result.failure(AppErrorMapper.map(e));
    }
  }

  @override
  Future<Result<List<TodoEntity>>> getTodos() async {
    try {
      final localTodos = await db.select(db.todos).get();
      final todosEntity = localTodos.map((todo) => todo.toEntity()).toList();
      return Result.success(todosEntity);
    } catch (e) {
      return Result.failure(AppErrorMapper.map(e));
    }
  }

  @override
  Future<Result<void>> saveTodo(TodoEntity todo) async {
    try {
      await db
          .into(db.todos)
          .insert(todo.toCompanion(), mode: InsertMode.insertOrReplace);
      return Result.success(null);
    } catch (e) {
      return Result.failure(AppErrorMapper.map(e));
    }
  }
}
