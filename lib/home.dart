// import 'package:drift/drift.dart';
import 'package:drift/drift.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:testdb/app.db/app.db.dart';
import 'package:testdb/const.dart';
import 'package:testdb/data.view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<QueryRow> data = [];

  Future<void> fetchData() async {
    List<QueryRow> result = await appDb.getAllData(tableName);
    setState(() {
      data = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
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
                  },
                  child: const Text("Add data into table"),
                ),
                TextButton(
                  onPressed: () async {
                    await appDb.createTable(tableName);
                  },
                  child: const Text("Create table"),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  List<QueryRow> result = await appDb.getAllData(tableName);
                  setState(() {
                    data = result;
                  });
                },
                icon: const Icon(Icons.refresh),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DriftDbViewer(appDb),
                    ),
                  );
                },
                icon: const Icon(Icons.remove_red_eye_sharp),
              ),
            ],
          ),
          body: ListView(
            children: [
              DataView(data),
            ],
          ),
        );
      },
    );
  }
}
