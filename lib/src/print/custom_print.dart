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
      '${PrintSettings().getDateTime()}${ConsoleColor.red}[ERROR]: $object${showStackTrace ? '\n${StackTrace.current}' : ''}${ConsoleColor.reset}';
  log(message);
}

void printInfo(Object object) {
  if (!PrintSettings().enabled) return;
  log('${PrintSettings().getDateTime()}${ConsoleColor.blue}[INFO]: $object${ConsoleColor.reset}');
}

void printWarning(Object object) {
  if (!PrintSettings().enabled) return;
  log('${PrintSettings().getDateTime()}${ConsoleColor.yellow}[WARNING]: $object${ConsoleColor.reset}');
}

void printSuccess(Object object) {
  if (!PrintSettings().enabled) return;
  log('${PrintSettings().getDateTime()}${ConsoleColor.green}[SUCCESS]: $object${ConsoleColor.reset}');
}

void printDebug(Object object) {
  if (!PrintSettings().enabled) return;
  log('${PrintSettings().getDateTime()}${ConsoleColor.magenta}[DEBUG]: $object${ConsoleColor.reset}');
}

void printCritical(Object object) {
  if (!PrintSettings().enabled) return;
  log('${PrintSettings().getDateTime()}${ConsoleColor.cyan}[CRITICAL]: $object${ConsoleColor.reset}');
}

void printVerbose(Object object) {
  if (!PrintSettings().enabled) return;
  log('${PrintSettings().getDateTime()}${ConsoleColor.gray}[VERBOSE]: $object${ConsoleColor.reset}');
}

void printCustom(Object object, ConsoleColor color) {
  if (!PrintSettings().enabled) return;
  log('${PrintSettings().getDateTime()}${color}[CUSTOM]: $object${ConsoleColor.reset}');
}
