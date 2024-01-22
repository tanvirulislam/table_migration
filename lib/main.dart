import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testdb/app.db/app.db.dart';
import 'package:testdb/init.directory.dart';
import 'package:testdb/user.list.dart';

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
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const UsersList(),
      ),
    );
  }
}
