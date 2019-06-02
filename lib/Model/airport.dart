// To parse this JSON data, do
//
//     final airport = airportFromJson(jsonString);

import 'dart:convert';

Airport airportFromJson(String str) => Airport.fromJson(json.decode(str));

String airportToJson(Airport data) => json.encode(data.toJson());

class Airport {
  List<Aeroport> aeroports;

  Airport({
    this.aeroports,
  });

  factory Airport.fromJson(Map<String, dynamic> json) => new Airport(
        aeroports: new List<Aeroport>.from(
            json["Aeroports"].map((x) => Aeroport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Aeroports": new List<dynamic>.from(aeroports.map((x) => x.toJson())),
      };
}

class Aeroport {
  int arpId;
  String arpIataCode;
  String arpIcaoCode;
  String arpName;
  String pacCountryCode;
  String pacIcaoCode;
  String arpCountryName;

  Aeroport({
    this.arpId,
    this.arpIataCode,
    this.arpIcaoCode,
    this.arpName,
    this.pacCountryCode,
    this.pacIcaoCode,
    this.arpCountryName,
  });

  factory Aeroport.fromJson(Map<String, dynamic> json) => new Aeroport(
        arpId: json["arp_id"],
        arpIataCode: json["arp_iata_code"],
        arpIcaoCode: json["arp_icao_code"],
        arpName: json["arp_name"],
        pacCountryCode: json["pac_country_code"],
        pacIcaoCode: json["pac_icao_code"],
        arpCountryName: json["arp_country_name"],
      );

  Map<String, dynamic> toJson() => {
        "arp_id": arpId,
        "arp_iata_code": arpIataCode,
        "arp_icao_code": arpIcaoCode,
        "arp_name": arpName,
        "pac_country_code": pacCountryCode,
        "pac_icao_code": pacIcaoCode,
        "arp_country_name": arpCountryName,
      };
}
