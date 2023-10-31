// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.db.dart';

// ignore_for_file: type=lint
class $CategoryTableTable extends CategoryTable
    with TableInfo<$CategoryTableTable, CategoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _slMeta = const VerificationMeta('sl');
  @override
  late final GeneratedColumn<int> sl = GeneratedColumn<int>(
      'sl', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _villageMeta =
      const VerificationMeta('village');
  @override
  late final GeneratedColumn<String> village = GeneratedColumn<String>(
      'village', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [sl, id, name, address, village, gender];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_table';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('sl')) {
      context.handle(_slMeta, sl.isAcceptableOrUnknown(data['sl']!, _slMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('village')) {
      context.handle(_villageMeta,
          village.isAcceptableOrUnknown(data['village']!, _villageMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sl};
  @override
  CategoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryTableData(
      sl: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sl']),
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      village: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}village']),
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender']),
    );
  }

  @override
  $CategoryTableTable createAlias(String alias) {
    return $CategoryTableTable(attachedDatabase, alias);
  }
}

class CategoryTableData extends DataClass
    implements Insertable<CategoryTableData> {
  final int? sl;
  final String? id;
  final String? name;
  final String? address;
  final String? village;
  final String? gender;
  const CategoryTableData(
      {this.sl, this.id, this.name, this.address, this.village, this.gender});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || sl != null) {
      map['sl'] = Variable<int>(sl);
    }
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || village != null) {
      map['village'] = Variable<String>(village);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    return map;
  }

  CategoryTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryTableCompanion(
      sl: sl == null && nullToAbsent ? const Value.absent() : Value(sl),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      village: village == null && nullToAbsent
          ? const Value.absent()
          : Value(village),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
    );
  }

  factory CategoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryTableData(
      sl: serializer.fromJson<int?>(json['sl']),
      id: serializer.fromJson<String?>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      address: serializer.fromJson<String?>(json['address']),
      village: serializer.fromJson<String?>(json['village']),
      gender: serializer.fromJson<String?>(json['gender']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sl': serializer.toJson<int?>(sl),
      'id': serializer.toJson<String?>(id),
      'name': serializer.toJson<String?>(name),
      'address': serializer.toJson<String?>(address),
      'village': serializer.toJson<String?>(village),
      'gender': serializer.toJson<String?>(gender),
    };
  }

  CategoryTableData copyWith(
          {Value<int?> sl = const Value.absent(),
          Value<String?> id = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> village = const Value.absent(),
          Value<String?> gender = const Value.absent()}) =>
      CategoryTableData(
        sl: sl.present ? sl.value : this.sl,
        id: id.present ? id.value : this.id,
        name: name.present ? name.value : this.name,
        address: address.present ? address.value : this.address,
        village: village.present ? village.value : this.village,
        gender: gender.present ? gender.value : this.gender,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryTableData(')
          ..write('sl: $sl, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('village: $village, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(sl, id, name, address, village, gender);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryTableData &&
          other.sl == this.sl &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.village == this.village &&
          other.gender == this.gender);
}

class CategoryTableCompanion extends UpdateCompanion<CategoryTableData> {
  final Value<int?> sl;
  final Value<String?> id;
  final Value<String?> name;
  final Value<String?> address;
  final Value<String?> village;
  final Value<String?> gender;
  const CategoryTableCompanion({
    this.sl = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.village = const Value.absent(),
    this.gender = const Value.absent(),
  });
  CategoryTableCompanion.insert({
    this.sl = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.village = const Value.absent(),
    this.gender = const Value.absent(),
  });
  static Insertable<CategoryTableData> custom({
    Expression<int>? sl,
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? village,
    Expression<String>? gender,
  }) {
    return RawValuesInsertable({
      if (sl != null) 'sl': sl,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (village != null) 'village': village,
      if (gender != null) 'gender': gender,
    });
  }

  CategoryTableCompanion copyWith(
      {Value<int?>? sl,
      Value<String?>? id,
      Value<String?>? name,
      Value<String?>? address,
      Value<String?>? village,
      Value<String?>? gender}) {
    return CategoryTableCompanion(
      sl: sl ?? this.sl,
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      village: village ?? this.village,
      gender: gender ?? this.gender,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sl.present) {
      map['sl'] = Variable<int>(sl.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (village.present) {
      map['village'] = Variable<String>(village.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTableCompanion(')
          ..write('sl: $sl, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('village: $village, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $CategoryTableTable categoryTable = $CategoryTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [categoryTable];
}
