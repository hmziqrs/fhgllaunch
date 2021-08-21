import 'dart:io';

const LINUX = 'linux';
const WINDOWS = 'windows';
const MACOS = 'macos';
const ANDROID = 'android';
const IOS = 'ios';
const WEB = 'web-javascript';

const DESKTOP = [LINUX, WINDOWS, MACOS];
const MOBILE = [ANDROID, IOS];

//
const FLAVOR_STRING = '--flavor';
const FILE_STRING = '-t';

final SPLITTER = Platform.isWindows ? 'â€¢' : '•';
