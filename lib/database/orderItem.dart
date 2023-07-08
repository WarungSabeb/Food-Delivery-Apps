import 'package:drift/drift.dart';

class OrderItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get orderID => integer()();
  IntColumn get productID => integer()();
  IntColumn get quantity => integer()();
}
