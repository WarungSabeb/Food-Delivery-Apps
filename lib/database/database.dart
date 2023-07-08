import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:food_delivery/database/order.dart';
import 'package:food_delivery/database/orderItem.dart';
import 'package:food_delivery/database/product.dart';
import 'package:food_delivery/database/restaurant.dart';
import 'package:food_delivery/database/user.dart';
import 'package:food_delivery/database/cartDB.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DriftDatabase(
  tables: [Order, OrderItem, Product, Restaurant, User, CartDB],
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List> get allOrderEntries => select(order).get();

  Future<List<OrderData>> getAllOrders() {
    final orderQuery = select(order);
    return orderQuery.get();
  }

  Future<void> deleteAllOrders() async {
    await delete(order).go();
  }

  Future<void> deleteDatabase() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    await file.delete();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
