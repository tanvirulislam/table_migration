import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:testdb/app.db/tables/category.dart';
import 'package:testdb/init.directory.dart';

part 'app.db.g.dart';

late AppDatabase appDb;

@DriftDatabase(
  tables: [CategoryTable],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  Future<void> deleteTable() async {
    await appDb.customStatement("DROP TABLE category_table");
  }

  Future<void> createTable(String tableName) async {
    await appDb.customStatement(""" CREATE TABLE $tableName (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);
 """);
  }

  Future<void> insertData(String tableName, int id, String name) async {
    await appDb.customStatement(
      "INSERT INTO $tableName (id, name) VALUES ($id, '$name');",
    );
  }

  Future<List<QueryRow>> getAllData(String tableName) async {
    return await customSelect("SELECT * FROM $tableName;").get();
  }

  Future<void> deleteDataById(String tableName, int id) async {
    await customUpdate("DELETE FROM $tableName WHERE id = :id",
        variables: [Variable.withInt(id)]);
  }

  Future<void> updateNameById(String tableName, int id, String newName) async {
    await customUpdate("UPDATE $tableName SET name = :newName WHERE id = :id",
        variables: [Variable.withString(newName), Variable.withInt(id)]);
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
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
