import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

late final Directory deviceDirectory;
const dbFileName = 'testdb.db';
final dbFilePath = join(deviceDirectory.path, dbFileName);

Future<void> initDeviceDirectory() async {
  deviceDirectory = await _getDirectory();
}

Future<Directory> _getDirectory() async {
  Directory? directory;
  if (Platform.isWindows) {
    directory = await getApplicationSupportDirectory();
  }
  if (Platform.isAndroid) {
    directory = await getApplicationDocumentsDirectory();
  } else {
    directory = await getApplicationSupportDirectory();
    // print(directory.path);
  }
  return directory;
}
