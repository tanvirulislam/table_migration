import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testdb/app.db/app.db.dart';
import 'package:testdb/const.dart';
import 'package:testdb/provider.dart';

class UsersList extends ConsumerWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userListProvider).when(
          data: (data) {
            final refresh = ref.refresh(userListProvider);
            return Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    TextButton(
                      onPressed: () async {
                        appDb.insertData(
                          tableName,
                          random.nextInt(99),
                          generateRandomString(characters, 5),
                        );
                        refresh;
                      },
                      child: const Text("Add data into table"),
                    ),
                    TextButton(
                      onPressed: () async => await appDb.createTable(tableName),
                      child: const Text("Create table"),
                    ),
                    TextButton(
                      onPressed: () async {
                        appDb.deleteTable(tableName);
                      },
                      child: const Text("Delete table"),
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        border: TableBorder.all(color: Colors.grey.shade300),
                        children: [
                          ...List.generate(
                            data?.length ?? 0,
                            (index) {
                              final user = data?[index];
                              return TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${user?.id ?? ''}"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(user?.name ?? ''),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      onChanged: (value) async {
                                        appDb.updateNameById(
                                          tableName,
                                          user?.id ?? 0,
                                          value,
                                        );
                                        refresh;
                                      },
                                      initialValue: user?.name,
                                      decoration: inputDecoration,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      appDb.deleteDataById(
                                          tableName, user?.id ?? 0);
                                    },
                                    icon: const Icon(Icons.delete_outline),
                                  )
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Text("Loading"),
        );
  }
}
