import 'dart:io';

import 'package:fvslaunch/src/constants.dart';
import 'package:fvslaunch/src/models/device.dart';

class DeviceService {
  Future<List<Device>?> load() async {
    final result = await Process.run(
      'flutter',
      ['devices'],
      runInShell: Platform.isWindows,
    );
    if (result.stderr != '') {
      print('Error while executing flutter devices');
      print(result.stderr);
    } else if (result.stdout != '') {
      return _filterResult(result.stdout);
    } else {
      print('Error can not process your request');
    }
    return null;
  }

  List<Device> _filterResult(String result) {
    final list = result.split('\n');
    final filtered = list
        .map((string) => string.split(SPLITTER))
        .where((subList) => subList.length > 1);

    return _generateDevices(filtered);
  }

  List<Device> _generateDevices(Iterable<List<String>> list) {
    return list.map((array) {
      final name = array[0].trim();
      final deviceId = array[1].trim();
      return Device(
        name: name,
        deviceId: deviceId,
        type: 'dart',
        request: 'launch',
        args: [],
      );
    }).toList();
  }
}
