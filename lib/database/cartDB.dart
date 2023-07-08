import 'package:drift/drift.dart';

class CartDB extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get foodName => text().withLength(max: 100)();
  IntColumn get quantity => integer()();
  IntColumn get price => integer()();
}
