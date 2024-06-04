import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

Future<dynamic> httpLoadDynamic(String url) async {
  log('httpLoadDynamic : Url: $url');
  try {
    final dio = Dio();
    final response = await dio.get(
      url,
      // options: Options(responseType: ResponseType.bytes),
      onReceiveProgress: (count, total) {
        // log('$url               =====               downloading ($total from $count)');
      },
    );

    return response.data;
  } catch (e) {
    log('Error httpLoadDynamic : Url: $url \n Error: $e');
    return null;
  } finally {}
}

File changeFileNameOnlySync(File file, String newFileName) {
  var path = file.path;
  var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
  var newPath = path.substring(0, lastSeparator + 1) + newFileName;
  return file.renameSync(newPath);
}

///return [true] if is Mobile Platform
///
///check for IOS and Android
// bool isMobile() {
//   return Platform.isIOS || Platform.isAndroid;
// }

// Color hexToColor(String? hexString) {
//   if (hexString == null) {
//     return Colors.black;
//   }
//   final hexRegex = RegExp(r'([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6})$');

//   hexString = hexString.replaceAll('#', '');
//   if (!hexRegex.hasMatch(hexString)) {
//     return Colors.black;
//   }

//   final buffer = StringBuffer();
//   if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
//   buffer.write(hexString);
//   return Color(int.tryParse(buffer.toString(), radix: 16) ?? 0xFF000000);
// }

// String colorToHex(Color color) {
//   return color.value.toRadixString(16).padLeft(8, '0').toUpperCase();
// }

///separate the text in tokens (words)
List<String> getTokensFromText(String text) {
  List<String> tokens = [];
  String word = '';
  for (var i = 0; i < text.length; i++) {
    if (text[i] == ' ') {
      if (word.isNotEmpty) tokens.add(word);
      word = '';
      continue;
    } else {
      //regex for puntuation " "
      if (RegExp(r'[^A-Za-zÀ-ÖØ-öø-ÿ0-9]').hasMatch(text[i])) {
        if (word.isNotEmpty) {
          tokens.add(word);
          word = '';
        }
        if (text[i].isNotEmpty) tokens.add(text[i]);
        word = '';
        continue;
      } else {
        word += text[i];
        //when the text ends without puntuation
        if (i + 1 == text.length) {
          tokens.add(word);
          word = '';
        }
      }
    }
  }
  return tokens;
}

///remove all non ascii characters
///
///only ascii from 32 to 255 remain
String removeEspecialCharacthers(String value, [String changeFor = ' ']) {
  List<String> text = List<String>.generate(value.length, (index) => value[index]);
  // List<int> utf8List = value.codeUnits.toList();
  // if (utf8List.where((element) => element > 255).isNotEmpty) {
  for (int i = 0; i < text.length; i++) {
    var char = text[i].codeUnits[0];
    if (char > 255 && char < 32) {
      text[i] = changeFor;
    }
  }
  // }
  return text.join();
}
