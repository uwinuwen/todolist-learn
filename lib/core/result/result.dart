import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todolist_learn/core/errors/app_error.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = _Success;
  const factory Result.failure(AppError error) = _Failure;
}
