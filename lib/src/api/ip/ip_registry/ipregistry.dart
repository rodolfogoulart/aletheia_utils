import 'package:dio/dio.dart';

import 'ipregistry.model.dart';

///from (stackoverflow)[https://stackoverflow.com/questions/63768271/how-to-get-current-country-of-device-without-asking-for-location-permission-flu]
Future<IpRegistry?> apiIpRegistry() async {
  final dio = Dio();

  final response = await dio.get('https://api.ipregistry.co?key=tryout');

  if (response.statusCode == 200) {
    return IpRegistry.fromJson(response.data);
  } else {
    throw Exception('Failed to get user country from IP address');
  }
}
