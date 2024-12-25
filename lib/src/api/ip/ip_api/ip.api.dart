import 'package:dio/dio.dart';

import 'ip.api.model.dart';

///API search for IP information
///
///docs on [https://ip-api.com/docs/api:json]
///
///{query} can be a single IPv4/IPv6 address or a domain name. If you don't supply a query the current IP address will be used.

Future<IpApi?> getIpApi(
    {String query = '',
    String fields = '?fields=status,message,continent,country,countryCode,region,regionName,city,query'}) async {
  final dio = Dio();
  // var fields = '?fields=status,message,continent,country,countryCode,region,regionName,city,query';
  //
  final response = await dio.get('http://ip-api.com/json/$query$fields');

  if (response.statusCode == 200) {
    if (response.data is Map) return IpApi.fromMap(response.data);
    if (response.data is String) return IpApi.fromJson(response.data);
  } else {
    throw Exception('Failed to get user country from IP address');
  }
  return null;
}
