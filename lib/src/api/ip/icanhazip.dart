import 'package:dio/dio.dart';

//from https://github.com/WorkWithAfridi/IP_Country_Lookup-Package/blob/master/lib/api/api_repo.dart
Future<String?> getUserIPAddress() async {
  try {
    final res = await Dio().get('https://icanhazip.com/');
    var data = res.data;

    /// Need to substring res, cause the ip data contains an end line.
    return data.toString().trim();
  } catch (err) {
    return null;
  }
}
