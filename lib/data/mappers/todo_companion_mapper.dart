import 'package:drift/drift.dart';
import 'package:todolist_learn/database/app_database.dart';
import 'package:todolist_learn/domain/entities/todo_entity.dart';

extension TodoCompanionMapper on TodoEntity {
  TodosCompanion toCompanion() => TodosCompanion(
    id: Value(id!),
    title: Value(title),
    isCompleted: Value(isCompleted),
  );
}
