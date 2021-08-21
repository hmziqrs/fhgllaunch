import 'package:fvslaunch/src/services/JSONWriter.dart';
import 'package:fvslaunch/src/services/config.dart';
import 'package:fvslaunch/src/services/device.dart';

void main(List<String> arguments) async {
  final configs = await ConfigsService().load();

  final devices = await DeviceService().load();

  JSONWriterService().write(devices: devices!, configs: configs);

  // print(devices);
}
