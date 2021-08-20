import 'dart:convert';

class Config {
  final String? windowsEntryFile;
  Config({
    this.windowsEntryFile,
  });

  Map<String, dynamic> toMap() {
    return {
      'windowsEntryFile': windowsEntryFile,
    };
  }

  static Config? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return Config(
      windowsEntryFile: map['windowsEntryFile'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Config.fromJson(String source) =>
      Config.fromMap(json.decode(source))!;

  @override
  String toString() => 'Config(windowsEntryFile: $windowsEntryFile)';
}
