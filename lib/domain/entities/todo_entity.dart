import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';

@freezed
abstract class TodoEntity with _$TodoEntity {
  const factory TodoEntity({
    required int id,
    required String title,
    @Default(false) bool isCompleted,
  }) = _TodoEntity;
}
