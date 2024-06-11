import 'package:aletheia_utils/aletheia_utils.dart';

void main() {
  printTokens(text) {
    var list = getTokensFromText(text);
    // var list2 = RegExp(r'''\w+(['"-]\w+)?''').allMatches(text).toList();
    print('------------------ "$text" ------------------');
    // print(list2.map((x) => '"${x.group(0)}"').join(', '));
    print(list.map((x) => '"$x"').join(', '));
    print('------------------ ------- ------------------');
  }

  // var text = 'Hello World';
  // printText(text);

  printTokens('-dizei-lhes');

  printTokens('dizei-lhes-');

  printTokens('dizei-lhes que assim como, diz o Senhor');

  printTokens('os céus e a terra: assim foi (fez) tudo que era bom');

  printTokens('''it's good, i love you. ''');
}
