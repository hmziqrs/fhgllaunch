import 'package:fvslaunch/src/services/config.dart';
import 'package:fvslaunch/src/services/device.dart';

void main(List<String> arguments) async {
  final configs = await ConfigsService().load();

  final devices = await DeviceService().load();

  print(devices);
}
