import 'package:fvslaunch/src/constants.dart';

import 'package:fvslaunch/src/models/config_device.dart';
import 'package:fvslaunch/src/models/config.dart';
import 'package:fvslaunch/src/models/device.dart';

class JSONWriterService {
  void write({Config? configs, required List<Device> devices}) {
    var parsed = devices;

    if (configs != null) {
      parsed = _addConfigsToDevices(configs, devices);
    }
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
      print('PRE: $index $args');
      if (index == -1) {
        args.add(FLAVOR_FLAG);
      }
      if (index > -1 && args.length >= index + 2) {
        args[index + 1] = config.flavor!;
      } else {
        args.add(config.flavor!);
      }
      print('POST: $index $args ${device.type}');
    }

    if (config.file != null) {
      final index = args.indexOf(FILE_FLAG);
      if (index == -1) {
        args.add(FILE_FLAG);
      } else if (args.length >= index + 2) {
        args[index + 1] = config.flavor!;
      } else {
        args.add(config.flavor!);
      }
    }

    return device.copyWith(args: args);
  }
}
