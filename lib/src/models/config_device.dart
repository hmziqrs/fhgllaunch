import 'dart:convert';

class ConfigDevice {
  final String? flavor;
  final String? file;
  final List<String>? args;
  ConfigDevice({
    this.args,
    this.file,
    this.flavor,
  });

  Map<String, dynamic> toMap() {
    return {
      'args': args,
      'file': file,
      'flavor': flavor,
    };
  }

  static ConfigDevice? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return ConfigDevice(
      file: map['file'],
      flavor: map['flavor'],
      args: List<String>.from(map['args'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigDevice.fromJson(String source) =>
      ConfigDevice.fromMap(json.decode(source))!;

  @override
  String toString() =>
      'ConfigDevice(flavor: $flavor, file: $file, args: $args)';
}
