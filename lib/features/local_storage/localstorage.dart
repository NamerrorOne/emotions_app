import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LocalStorage {
  String content = 'Нет данных';

  Future<String> getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> getlocalFile() async {
    final path = await getLocalPath();
    return File('${path}/demo_localfile.txt');
  }

  Future<File> writeTextToLocalFile(String text) async {
    final File file = await getlocalFile();
    return file.writeAsString(text);
  }

  Future readTextFromLocalFile() async {
    try {
      final file = await getlocalFile();
      content = await file.readAsString();
    } catch (error) {
      this.content = 'Error ${error}';
    }
  }
}
