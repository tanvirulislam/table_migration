import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:testdb/app.db/tables/category.dart';
import 'package:testdb/init.directory.dart';

part 'app.db.g.dart';

late AppDatabase appDb;

@DriftDatabase(tables: [CategoryTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 4) {
          print("village");
          return await m.addColumn(categoryTable, categoryTable.village);
        }
        if (from < 5) {
          print("gender");
          return await m.addColumn(categoryTable, categoryTable.gender);
        }
      },
    );
  }

  @override
  int get schemaVersion => 5;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = File(dbFilePath);
    return NativeDatabase(file);
  });
}
