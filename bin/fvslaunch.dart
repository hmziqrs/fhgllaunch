import 'dart:io';

import 'package:fvslaunch/src/models/device.dart';
import 'package:fvslaunch/src/constants.dart';
import 'package:fvslaunch/src/services/config.dart';

void main(List<String> arguments) async {
  final processResult = await Process.run(
    'flutter',
    ['devices'],
    runInShell: Platform.isWindows,
  );

  final result = processResult.stdout.split('\n') as List<String>;
  final filteredResult = result
      .map((string) => string.split(SPLITTER))
      .toList()
      .where((subList) => subList.length > 1);

  final devices = filteredResult.map((array) {
    final name = array[0].trim();
    final deviceId = array[1].trim();
    return Device.fromMap({
      'name': name,
      'deviceId': deviceId,
      'type': 'dart',
      'request': 'launch',
      'args': [],
    });
  });

  final config = ConfigsService();
  await config.load();

  print(devices);
}
