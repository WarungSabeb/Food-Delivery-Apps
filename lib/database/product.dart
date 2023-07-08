import 'package:drift/drift.dart';

class Product extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get restaurantID => integer()();
  TextColumn get foodImage => text().withLength(max: 100)();
  TextColumn get foodMenu => text().withLength(max: 100)();
  TextColumn get foodDescription => text().withLength(max: 100)();
  IntColumn get foodPrice => integer()();
  BoolColumn get isFoodAvailable => boolean().withDefault(const Constant(false))();
}
