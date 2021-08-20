import 'dart:convert';

class Device {
  final String name;
  final String deviceId;
  final String type;
  final String request;
  final List<String> args;

  Device({
    required this.name,
    required this.deviceId,
    required this.type,
    required this.request,
    required this.args,
  });

  Device copyWith({
    String? name,
    String? deviceId,
    String? type,
    String? request,
    List<String>? args,
  }) {
    return Device(
      name: name ?? this.name,
      deviceId: deviceId ?? this.deviceId,
      type: type ?? this.type,
      request: request ?? this.request,
      args: args ?? this.args,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'deviceId': deviceId,
      'type': type,
      'request': request,
      'args': args,
    };
  }

  static Device? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return Device(
      name: map['name'],
      deviceId: map['deviceId'],
      type: map['type'],
      request: map['request'],
      args: List<String>.from(map['args'] ?? <String>[]),
    );
  }

  String toJson() => json.encode(toMap());

  factory Device.fromJson(String source) => Device.fromMap(
        json.decode(source),
      )!;

  @override
  String toString() {
    return 'Device(name: $name, deviceId: $deviceId, type: $type, request: $request, args: $args)';
  }
}
