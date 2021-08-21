import 'dart:io';

const LINUX = 'linux';
const WINDOWS = 'windows';
const MACOS = 'darwin';
const ANDROID = 'android';
const IOS = 'ios';
const WEB = 'web-javascript';

const DESKTOP = [LINUX, WINDOWS, MACOS];
const MOBILE = [ANDROID, IOS];

//
const FLAVOR_FLAG = '--flavor';
const FILE_FLAG = '-t';

final SPLITTER = Platform.isWindows ? 'â€¢' : '•';
