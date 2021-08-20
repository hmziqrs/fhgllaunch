import 'dart:convert';
import 'dart:io';

import 'package:fvslaunch/src/models/config.dart';

class ConfigsService {
  static const FILE_KEY = 'vslaunch';

  late File _file;
  late Config _data;

  Config get data => _data;

  Future<void> load() async {
    _file = File(Directory.current.uri.resolve('fhgl.json').toFilePath());
    if (await _file.exists()) {
      await _verifyAndParse();
    } else {
      print('No configs found');
    }
  }

  Future<void> _verifyAndParse() async {
    final content = await _file.readAsString();
    if (content.isEmpty) {
      print('Empty configs file');
    } else {
      final json = jsonDecode(content);
      if (json is Map && json[FILE_KEY] != null && json[FILE_KEY] is Map) {
        _data = Config.fromMap(json[FILE_KEY])!;
        print(_data);
      }
    }
  }
}
