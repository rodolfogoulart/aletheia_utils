import 'dart:developer';

enum ConsoleColor {
  reset,
  red,
  blue,
  yellow,
  green,
  magenta,
  cyan,
  white,
  gray,
}

const Map<ConsoleColor, String> colorCodes = {
  ConsoleColor.reset: '\x1B[0m',
  ConsoleColor.red: '\x1B[31m',
  ConsoleColor.blue: '\x1B[34m',
  ConsoleColor.yellow: '\x1B[33m',
  ConsoleColor.green: '\x1B[32m',
  ConsoleColor.magenta: '\x1B[35m',
  ConsoleColor.cyan: '\x1B[36m',
  ConsoleColor.white: '\x1B[37m',
  ConsoleColor.gray: '\x1B[90m',
};

void printError(Object object, [bool showStackTrace = false]) {
  // if (!kDebugMode) return;
  var message =
      '${colorCodes[ConsoleColor.red]}[ERROR]: $object${showStackTrace ? '\n${StackTrace.current}' : ''}${colorCodes[ConsoleColor.reset]}';
  log(message);
  //todo
  // if (saveToFile) {
  // }
}

void printInfo(Object object) {
  // if (!kDebugMode) return;
  log('${colorCodes[ConsoleColor.blue]}[INFO]: $object${colorCodes[ConsoleColor.reset]}');
}

void printWarning(Object object) {
  // if (!kDebugMode) return;
  log('${colorCodes[ConsoleColor.yellow]}[WARNING]: $object${colorCodes[ConsoleColor.reset]}');
}

void printSuccess(Object object) {
  // if (!kDebugMode) return;
  log('${colorCodes[ConsoleColor.green]}[SUCCESS]: $object${colorCodes[ConsoleColor.reset]}');
}

void printDebug(Object object) {
  // if (!kDebugMode) return;
  log('${colorCodes[ConsoleColor.magenta]}[DEBUG]: $object${colorCodes[ConsoleColor.reset]}');
}

void printCritical(Object object) {
  // if (!kDebugMode) return;
  log('${colorCodes[ConsoleColor.cyan]}[CRITICAL]: $object${colorCodes[ConsoleColor.reset]}');
}

void printVerbose(Object object) {
  // if (!kDebugMode) return;
  log('${colorCodes[ConsoleColor.gray]}[VERBOSE]: $object${colorCodes[ConsoleColor.reset]}');
}

void printCustom(Object object, ConsoleColor color) {
  // if (!kDebugMode) return;
  log('${colorCodes[color]}[CUSTOM]: $object${colorCodes[ConsoleColor.reset]}');
}
