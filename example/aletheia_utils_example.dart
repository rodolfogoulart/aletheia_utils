// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:aletheia_utils/aletheia_utils.dart';

void main() {
  extractQuery();
  // readQuery();
}

readQuery() {
  File file = File('D:\\Desenvolvimento\\Source - Aletheia\\app\\patches\\1\\query_update_book_1.json');
  var text = file.readAsStringSync();
  List<dynamic> json = jsonDecode(text);
  for (var element in json) {
    print(element['sqlExec']);
  }
}

extractQuery() {
  File file = File('D:\\Desenvolvimento\\Source - Aletheia\\app\\patches\\1\\query_results-2024-06-15_104853.json');
  // File file = File('D:\\Desenvolvimento\\Source - Aletheia\\app\\patches\\1\\query_book_1.json');

  var text = file.readAsStringSync();
  List<dynamic> json = jsonDecode(text);

  String idBook = '';

  List<Query> queries = [];

  for (var i = 0; i < json.length; i++) {
    String sql = json[i]['sqlExec'];
    var id =
        sql.substring(sql.indexOf('verse.id_book =') + 'verse.id_book ='.length, sql.indexOf('and verse.number_chapter')).trim();
    if (i == 0) {
      idBook = id.trim();
    }
    //
    if (idBook == id.trim()) {
      queries.add(Query(sqlExec: sql));
    } else {
      File fileWrite = File('D:\\Desenvolvimento\\Source - Aletheia\\app\\patches\\1\\query_update_book_' + idBook + '.json');
      fileWrite.writeAsStringSync(jsonEncode(queries.map((x) => x.toMap()).toList()));
      queries.clear();
      //
      queries.add(Query(sqlExec: sql));
      idBook = id.trim();
      //
      print('------------------ "$idBook" ------------------');
    }
  }
}

class Query {
  // int? id;
  String sqlExec;
  Query({
    required this.sqlExec,
    // this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sqlExec': sqlExec,
    };
  }

  factory Query.fromMap(Map<String, dynamic> map) {
    return Query(
      sqlExec: map['sqlExec'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Query.fromJson(String source) => Query.fromMap(json.decode(source) as Map<String, dynamic>);
}

testGetTokensFromText() {
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
