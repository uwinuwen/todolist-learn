import 'package:todolist_learn/database/app_database.dart';
import 'package:todolist_learn/domain/entities/todo_entity.dart';

extension TodoEntityMapper on Todo {
  TodoEntity toEntity() =>
      TodoEntity(id: id, title: title, isCompleted: isCompleted);
}
