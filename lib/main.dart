import 'package:drift/drift.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testdb/app.db/app.db.dart';
import 'package:testdb/app.db/tables/category.dart';
import 'package:testdb/init.directory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDeviceDirectory();
  appDb = AppDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DriftDbViewer(appDb),
                ),
              ),
              icon: const Icon(Icons.remove_red_eye_sharp),
            ),
            IconButton(
              onPressed: () async {
                await CategoryTable.addCategory(
                  const CategoryTableCompanion(
                    id: Value('id'),
                    name: Value('name'),
                    address: Value('qwoj'),
                    village: Value("village"),
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
