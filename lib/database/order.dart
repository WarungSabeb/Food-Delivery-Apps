import 'package:drift/drift.dart';

class Order extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get restoName => text().withLength(max: 100)();
  DateTimeColumn get orderTime => dateTime()();
  IntColumn get price => integer()();
}
