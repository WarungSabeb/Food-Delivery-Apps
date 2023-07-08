import 'package:drift/drift.dart';

class Restaurant extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get restoName => text().withLength(max: 100)();
  RealColumn get restoRating => real()();
  RealColumn get restoDistance => real()();
  TextColumn get restoImage => text().withLength(max: 100)();
  TextColumn get restoJudges => text().withLength(max: 100)();
  TextColumn get restoLocation => text().withLength(max: 100)();
  TextColumn get restoEstPrice => text().withLength(max: 100)();
  IntColumn get estMinimum => integer()();
  IntColumn get estMaximum => integer()();
  BoolColumn get isRecommended => boolean().withDefault(const Constant(true))();




}