import 'package:flutter/material.dart';
import 'package:testdb/app.db/app.db.dart';
import 'package:testdb/home.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
