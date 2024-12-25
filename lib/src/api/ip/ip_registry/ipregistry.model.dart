// ignore_for_file: public_member_api_docs, sort_constructors_first
class IpRegistry {
  final String ip;
  final String region;
  final String city;
  final String country;

  IpRegistry({required this.ip, required this.region, required this.city, required this.country});

  factory IpRegistry.fromJson(Map<String, dynamic> json) {
    return IpRegistry(
      ip: json['ip'] ?? '',
      region: json['region']['name'] ?? '',
      city: json['city'] ?? '',
      country: json['location']['country']['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ip': ip,
      'region': region,
      'city': city,
      'country': country,
    };
  }

  @override
  String toString() {
    return 'IpRegistry(ip: $ip, region: $region, city: $city, country: $country)';
  }
}
