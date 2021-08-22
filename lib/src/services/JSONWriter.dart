import 'dart:io';
import 'dart:convert';

import 'package:fhgllaunch/src/constants.dart';

import 'package:fhgllaunch/src/models/config_device.dart';
import 'package:fhgllaunch/src/models/config.dart';
import 'package:fhgllaunch/src/models/device.dart';

class JSONWriterService {
  void write({Config? configs, required List<Device> devices}) async {
    var parsed = devices;

    if (configs != null) {
      parsed = _addConfigsToDevices(configs, devices);
    }

    final map = _mapDevicesToTemplate(parsed);

    await _createJsonFile(map);

    print("JSON GENERATED SUCCESSFULLY");
  }

  List<Device> _addConfigsToDevices(Config configs, List<Device> devices) {
    return devices.map((device) {
      var newDevice = device.copyWith();
      if (configs.all != null) {
        newDevice = _mapDeviceConfig(configs.all!, device);
      }
      if (configs.desktop != null && DESKTOP.contains(device.os)) {
        newDevice = _mapDeviceConfig(configs.desktop!, device);
      }
      if (configs.mobile != null && MOBILE.contains(device.os)) {
        newDevice = _mapDeviceConfig(configs.mobile!, device);
      }
      if (configs.web != null && WEB == device.os) {
        newDevice = _mapDeviceConfig(configs.web!, device);
      }
      if (configs.macos != null && MACOS == device.os) {
        newDevice = _mapDeviceConfig(configs.macos!, device);
      }
      if (configs.windows != null && WINDOWS == device.os) {
        newDevice = _mapDeviceConfig(configs.windows!, device);
      }
      if (configs.linux != null && LINUX == device.os) {
        newDevice = _mapDeviceConfig(configs.linux!, device);
      }
      if (configs.android != null && ANDROID == device.os) {
        newDevice = _mapDeviceConfig(configs.android!, device);
      }
      if (configs.ios != null && IOS == device.os) {
        newDevice = _mapDeviceConfig(configs.ios!, device);
      }
      return newDevice;
    }).toList();
  }

  Device _mapDeviceConfig(ConfigDevice config, Device device) {
    final args = <String>[];
    if (config.args != null) {
      args.addAll(config.args!);
    }

    if (config.flavor != null) {
      final index = args.indexOf(FLAVOR_FLAG);
      if (index == -1) {
        args.add(FLAVOR_FLAG);
      }
      if (index > -1 && args.length >= index + 2) {
        args[index + 1] = config.flavor!;
      } else {
        args.add(config.flavor!);
      }
    }

    if (config.file != null) {
      final index = args.indexOf(FILE_FLAG);
      if (index == -1) {
        args.add(FILE_FLAG);
      }
      if (index > -1 && args.length >= index + 2) {
        args[index + 1] = config.file!;
      } else {
        args.add(config.file!);
      }
    }

    return device.copyWith(args: args);
  }

  Map<String, dynamic> _mapDevicesToTemplate(List<Device> devices) {
    return {
      'version': '1.0.0',
      'configurations': ([
        {
          'name': 'Flutter',
          'request': 'launch',
          'type': 'dart',
        },
        ...devices.map((e) => e.toMap()),
      ]),
    };
  }

  Future<void> _createJsonFile(Map<String, dynamic> map) async {
    final path = Directory.current.uri.resolve('.vscode/launch.json');
    final file = File(path.toFilePath());
    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    final encoder = JsonEncoder.withIndent('\t');
    final newJson = encoder.convert(map);

    await file.writeAsString(newJson);
  }
}
