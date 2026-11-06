import 'package:drift/drift.dart';

class Todos extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  BoolColumn get isCompleted => boolean()();
}
