import 'dart:convert';

import 'config_device.dart';

class Config {
  final ConfigDevice? all;

  // desktop
  final ConfigDevice? desktop;
  final ConfigDevice? windows;
  final ConfigDevice? macos;
  final ConfigDevice? linux;

  // mobile
  final ConfigDevice? mobile;
  final ConfigDevice? android;
  final ConfigDevice? ios;

  // web
  final ConfigDevice? web;

  Config({
    this.all,
    this.desktop,
    this.windows,
    this.macos,
    this.linux,
    this.mobile,
    this.android,
    this.ios,
    this.web,
  });

  Map<String, dynamic> toMap() {
    return {
      'all': all?.toMap(),
      'desktop': desktop?.toMap(),
      'windows': windows?.toMap(),
      'macos': macos?.toMap(),
      'linux': linux?.toMap(),
      'mobile': mobile?.toMap(),
      'android': android?.toMap(),
      'ios': ios?.toMap(),
      'web': web?.toMap(),
    };
  }

  static Config? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return Config(
      all: ConfigDevice.fromMap(map['all']),
      desktop: ConfigDevice?.fromMap(map['desktop']),
      windows: ConfigDevice.fromMap(map['windows']),
      macos: ConfigDevice.fromMap(map['macos']),
      linux: ConfigDevice.fromMap(map['linux']),
      mobile: ConfigDevice.fromMap(map['mobile']),
      android: ConfigDevice.fromMap(map['android']),
      ios: ConfigDevice.fromMap(map['ios']),
      web: ConfigDevice.fromMap(map['web']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Config.fromJson(String source) =>
      Config.fromMap(json.decode(source))!;

  @override
  String toString() {
    return 'Config(all: $all, desktop: $desktop, windows: $windows, macos: $macos, linux: $linux, mobile: $mobile, android: $android, ios: $ios, web: $web)';
  }
}
