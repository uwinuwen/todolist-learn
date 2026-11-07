import 'package:todolist_learn/core/errors/app_error.dart';

extension AppErrorMessage on AppError {
  String get message => when(
    database: () => 'Data lokal bermasalah.',
    unknown: () => 'Terjadi kesalahan',
  );
}
