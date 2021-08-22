import 'package:fhgllaunch/src/services/JSONWriter.dart';
import 'package:fhgllaunch/src/services/config.dart';
import 'package:fhgllaunch/src/services/device.dart';

void main(List<String> arguments) async {
  final configs = await ConfigsService().load();

  final devices = await DeviceService().load();

  JSONWriterService().write(devices: devices!, configs: configs);
}
