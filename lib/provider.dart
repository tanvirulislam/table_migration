import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testdb/app.db/app.db.dart';
import 'package:testdb/const.dart';
import 'package:testdb/model.dart';

final userListProvider =
    AsyncNotifierProvider<UserNotifier, List<User>?>(UserNotifier.new);

class UserNotifier extends AsyncNotifier<List<User>?> {
  @override
  Future<List<User>> build() async {
    List<QueryRow> users = await appDb.getAllUsers(tableName);

    return users.isNotEmpty ? convertQueryRowsToUserList(users) : [];
  }

  List<User> convertQueryRowsToUserList(List<QueryRow> queryRows) {
    return queryRows
        .map((queryRow) =>
            User(id: queryRow.data['id'], name: queryRow.data['name']))
        .toList();
  }
}
