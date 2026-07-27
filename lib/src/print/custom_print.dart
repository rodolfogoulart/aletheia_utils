import 'dart:developer';

enum ConsoleColor {
  reset('\x1B[0m'),
  red('\x1B[31m'),
  blue('\x1B[34m'),
  yellow('\x1B[33m'),
  green('\x1B[32m'),
  magenta('\x1B[35m'),
  cyan('\x1B[36m'),
  white('\x1B[37m'),
  gray('\x1B[90m');

  final String code;
  const ConsoleColor(this.code);
}

class PrintSettings {
  bool useDateTime = false;
  bool enabled = true;
  //singleton
  PrintSettings._internal();
  static final PrintSettings _instance = PrintSettings._internal();
  factory PrintSettings() => _instance;

  String getDateTime() {
    if (useDateTime) {
      return '${DateTime.now().toIso8601String()} | ';
    }
    return '';
  }
}

void printError(Object object, [bool showStackTrace = false]) {
  if (!PrintSettings().enabled) return;
  var message =
      '${PrintSettings().getDateTime()}${ConsoleColor.red.code}[ERROR]: $object${showStackTrace ? '\n${StackTrace.current}' : ''}${ConsoleColor.reset.code}';
  log(message);
}

void printInfo(Object object) {
  if (!PrintSettings().enabled) return;
  log('${PrintSettings().getDateTime()}${ConsoleColor.blue.code}[INFO]: $object${ConsoleColor.reset.code}');
}

void printWarning(Object object) {
  if (!PrintSettings().enabled) return;
  log('${PrintSettings().getDateTime()}${ConsoleColor.yellow.code}[WARNING]: $object${ConsoleColor.reset.code}');
}

void printSuccess(Object object) {
  if (!PrintSettings().enabled) return;
  log('${PrintSettings().getDateTime()}${ConsoleColor.green.code}[SUCCESS]: $object${ConsoleColor.reset.code}');
}

void printDebug(Object object) {
  if (!PrintSettings().enabled) return;
  log('${PrintSettings().getDateTime()}${ConsoleColor.magenta.code}[DEBUG]: $object${ConsoleColor.reset.code}');
}

void printCritical(Object object) {
  if (!PrintSettings().enabled) return;
  log('${PrintSettings().getDateTime()}${ConsoleColor.cyan.code}[CRITICAL]: $object${ConsoleColor.reset.code}');
}

void printVerbose(Object object) {
  if (!PrintSettings().enabled) return;
  log('${PrintSettings().getDateTime()}${ConsoleColor.gray.code}[VERBOSE]: $object${ConsoleColor.reset.code}');
}

void printCustom(Object object, ConsoleColor color) {
  if (!PrintSettings().enabled) return;
  log('${PrintSettings().getDateTime()}${color.code}[CUSTOM]: $object${ConsoleColor.reset.code}');
}
