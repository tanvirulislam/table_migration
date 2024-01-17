import 'package:drift/drift.dart';
import 'package:testdb/app.db/app.db.dart';

class CategoryTable extends Table {
  IntColumn get sl => integer().autoIncrement().nullable()();
  TextColumn get id => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get village => text().nullable()();
  TextColumn get gender => text().nullable()();

  static Future<int> addCategory(CategoryTableCompanion entry) {
    return appDb.into(appDb.categoryTable).insert(entry);
  }
}

class ProductTable extends Table {
  IntColumn get sl => integer().autoIncrement().nullable()();
  TextColumn get id => text().nullable()();
  TextColumn get name => text().nullable()();
}
