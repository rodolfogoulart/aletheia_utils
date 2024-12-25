import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class IpApi {
  ///IP used for the query
  String? query;

  ///Region/state
  String? region;
  String? city;
  String? country;
  String? continent;
  String? countryCode;
  String? regionName;

  ///latitude
  double? lat;

  ///longitude
  double? lon;

  String? currency;
  String? continentCode;
  String? district;
  String? zip;

  ///Timezone (tz)
  ///
  ///Example: America/Los_Angeles
  String? timezone;

  ///Timezone UTC DST offset in seconds
  int? offset;

  ///ISP name
  String? isp;

  ///AS number and organization, separated by space (RIR). Empty for IP blocks not being announced in BGP tables.
  ///
  ///Example: AS15169 Google Inc.
  String? as;
  String? org;

  ///AS name (RIR). Empty for IP blocks not being announced in BGP tables.
  String? asname;

  ///Reverse DNS of the IP (can delay response)
  String? reverse;

  ///Mobile (cellular) connection
  bool? mobile;

  ///Proxy, VPN or Tor exit address
  bool? proxy;

  ///Hosting, colocated or data center
  bool? hosting;
  IpApi({
    this.query,
    this.region,
    this.city,
    this.country,
    this.continent,
    this.countryCode,
    this.regionName,
    this.lat,
    this.lon,
    this.currency,
    this.continentCode,
    this.district,
    this.zip,
    this.timezone,
    this.offset,
    this.isp,
    this.as,
    this.org,
    this.asname,
    this.reverse,
    this.mobile,
    this.proxy,
    this.hosting,
  });

  IpApi copyWith({
    String? query,
    String? region,
    String? city,
    String? country,
    String? continent,
    String? countryCode,
    String? regionName,
    double? lat,
    double? lon,
    String? currency,
    String? continentCode,
    String? district,
    String? zip,
    String? timezone,
    int? offset,
    String? isp,
    String? as,
    String? org,
    String? asname,
    String? reverse,
    bool? mobile,
    bool? proxy,
    bool? hosting,
  }) {
    return IpApi(
      query: query ?? this.query,
      region: region ?? this.region,
      city: city ?? this.city,
      country: country ?? this.country,
      continent: continent ?? this.continent,
      countryCode: countryCode ?? this.countryCode,
      regionName: regionName ?? this.regionName,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      currency: currency ?? this.currency,
      continentCode: continentCode ?? this.continentCode,
      district: district ?? this.district,
      zip: zip ?? this.zip,
      timezone: timezone ?? this.timezone,
      offset: offset ?? this.offset,
      isp: isp ?? this.isp,
      as: as ?? this.as,
      org: org ?? this.org,
      asname: asname ?? this.asname,
      reverse: reverse ?? this.reverse,
      mobile: mobile ?? this.mobile,
      proxy: proxy ?? this.proxy,
      hosting: hosting ?? this.hosting,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'query': query,
      'region': region,
      'city': city,
      'country': country,
      'continent': continent,
      'countryCode': countryCode,
      'regionName': regionName,
      'lat': lat,
      'lon': lon,
      'currency': currency,
      'continentCode': continentCode,
      'district': district,
      'zip': zip,
      'timezone': timezone,
      'offset': offset,
      'isp': isp,
      'as': as,
      'org': org,
      'asname': asname,
      'reverse': reverse,
      'mobile': mobile,
      'proxy': proxy,
      'hosting': hosting,
    };
  }

  factory IpApi.fromMap(Map<String, dynamic> map) {
    return IpApi(
      query: map['query'] != null ? map['query'] as String : null,
      region: map['region'] != null ? map['region'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      continent: map['continent'] != null ? map['continent'] as String : null,
      countryCode: map['countryCode'] != null ? map['countryCode'] as String : null,
      regionName: map['regionName'] != null ? map['regionName'] as String : null,
      lat: map['lat'] != null ? map['lat'] as double : null,
      lon: map['lon'] != null ? map['lon'] as double : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      continentCode: map['continentCode'] != null ? map['continentCode'] as String : null,
      district: map['district'] != null ? map['district'] as String : null,
      zip: map['zip'] != null ? map['zip'] as String : null,
      timezone: map['timezone'] != null ? map['timezone'] as String : null,
      offset: map['offset'] != null ? map['offset'] as int : null,
      isp: map['isp'] != null ? map['isp'] as String : null,
      as: map['as'] != null ? map['as'] as String : null,
      org: map['org'] != null ? map['org'] as String : null,
      asname: map['asname'] != null ? map['asname'] as String : null,
      reverse: map['reverse'] != null ? map['reverse'] as String : null,
      mobile: map['mobile'] != null ? map['mobile'] as bool : null,
      proxy: map['proxy'] != null ? map['proxy'] as bool : null,
      hosting: map['hosting'] != null ? map['hosting'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory IpApi.fromJson(String source) => IpApi.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'IpApi(query: $query, region: $region, city: $city, country: $country, continent: $continent, countryCode: $countryCode, regionName: $regionName, lat: $lat, lon: $lon, currency: $currency, continentCode: $continentCode, district: $district, zip: $zip, timezone: $timezone, offset: $offset, isp: $isp, as: $as, org: $org, asname: $asname, reverse: $reverse, mobile: $mobile, proxy: $proxy, hosting: $hosting)';
  }

  @override
  bool operator ==(covariant IpApi other) {
    if (identical(this, other)) return true;

    return other.query == query &&
        other.region == region &&
        other.city == city &&
        other.country == country &&
        other.continent == continent &&
        other.countryCode == countryCode &&
        other.regionName == regionName &&
        other.lat == lat &&
        other.lon == lon &&
        other.currency == currency &&
        other.continentCode == continentCode &&
        other.district == district &&
        other.zip == zip &&
        other.timezone == timezone &&
        other.offset == offset &&
        other.isp == isp &&
        other.as == as &&
        other.org == org &&
        other.asname == asname &&
        other.reverse == reverse &&
        other.mobile == mobile &&
        other.proxy == proxy &&
        other.hosting == hosting;
  }

  @override
  int get hashCode {
    return query.hashCode ^
        region.hashCode ^
        city.hashCode ^
        country.hashCode ^
        continent.hashCode ^
        countryCode.hashCode ^
        regionName.hashCode ^
        lat.hashCode ^
        lon.hashCode ^
        currency.hashCode ^
        continentCode.hashCode ^
        district.hashCode ^
        zip.hashCode ^
        timezone.hashCode ^
        offset.hashCode ^
        isp.hashCode ^
        as.hashCode ^
        org.hashCode ^
        asname.hashCode ^
        reverse.hashCode ^
        mobile.hashCode ^
        proxy.hashCode ^
        hosting.hashCode;
  }
}
