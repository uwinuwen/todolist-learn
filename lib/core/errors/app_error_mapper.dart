import 'package:drift/native.dart';
import 'package:todolist_learn/core/errors/app_error.dart';

class AppErrorMapper {
  static AppError map(Object error) {
    if (error is SqliteException) {
      return AppError.database();
    }
    return AppError.unknown();
  }
}
