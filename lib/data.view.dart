import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testdb/app.db/app.db.dart';
import 'package:testdb/const.dart';

class DataView extends ConsumerWidget {
  const DataView(this.data, {super.key});
  final List<QueryRow> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        var itemData = data[index].data;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            color: index.isEven ? Colors.grey.shade200 : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${itemData['id']}"),
                  Text("${itemData['name']}"),
                  SizedBox(
                    // height: 30,
                    width: 100,
                    child: TextFormField(
                      // controller: controller,
                      onChanged: (value) async {
                        print(value);
                        appDb.updateNameById(
                          tableName,
                          data[index].data['id'],
                          value,
                        );
                      },
                      // initialValue: "${itemData['name']}",
                      decoration: inputDecoration,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      appDb.deleteDataById(tableName, data[index].data['id']);
                    },
                    child: const Icon(Icons.delete_outline),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
