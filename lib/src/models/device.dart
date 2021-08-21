import 'dart:convert';

class Device {
  final String name;
  final String deviceId;
  final String type;
  final String request;
  final String os;
  final List<String> args;

  Device({
    required this.name,
    required this.deviceId,
    required this.type,
    required this.request,
    required this.os,
    required this.args,
  });

  Device copyWith({
    String? name,
    String? deviceId,
    String? type,
    String? request,
    String? os,
    List<String>? args,
  }) {
    return Device(
      name: name ?? this.name,
      deviceId: deviceId ?? this.deviceId,
      type: type ?? this.type,
      request: request ?? this.request,
      os: os ?? this.os,
      args: args ?? this.args,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'deviceId': deviceId,
      'type': type,
      'request': request,
      'os': os,
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
      os: map['os'],
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
