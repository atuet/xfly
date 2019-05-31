// To parse this JSON data, do
//
//     final flights = flightsFromJson(jsonString);

import 'dart:convert';

Flights flightsFromJson(String str) => Flights.fromJson(json.decode(str));

String flightsToJson(Flights data) => json.encode(data.toJson());

class Flights {
  List<Flight> flights;

  Flights({
    this.flights,
  });

  factory Flights.fromJson(Map<String, dynamic> json) => new Flights(
        flights: new List<Flight>.from(
            json["flights"].map((x) => Flight.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "flights": new List<dynamic>.from(flights.map((x) => x.toJson())),
      };
}

class Flight {
  DateTime lastUpdatedAt;
  DateTime actualLandingTime;
  DateTime actualOffBlockTime;
  String aircraftRegistration;
  AircraftType aircraftType;
  BaggageClaim baggageClaim;
  CheckinAllocations checkinAllocations;
  Codeshares codeshares;
  DateTime estimatedLandingTime;
  dynamic expectedTimeBoarding;
  dynamic expectedTimeGateClosing;
  dynamic expectedTimeGateOpen;
  DateTime expectedTimeOnBelt;
  String expectedSecurityFilter;
  FlightDirection flightDirection;
  String flightName;
  int flightNumber;
  String gate;
  Pier pier;
  String id;
  String mainFlight;
  String prefixIata;
  String prefixIcao;
  int airlineCode;
  dynamic publicEstimatedOffBlockTime;
  PublicFlightState publicFlightState;
  Route route;
  DateTime scheduleDateTime;
  DateTime scheduleDate;
  String scheduleTime;
  ServiceType serviceType;
  int terminal;
  TransferPositions transferPositions;
  String schemaVersion;

  Flight({
    this.lastUpdatedAt,
    this.actualLandingTime,
    this.actualOffBlockTime,
    this.aircraftRegistration,
    this.aircraftType,
    this.baggageClaim,
    this.checkinAllocations,
    this.codeshares,
    this.estimatedLandingTime,
    this.expectedTimeBoarding,
    this.expectedTimeGateClosing,
    this.expectedTimeGateOpen,
    this.expectedTimeOnBelt,
    this.expectedSecurityFilter,
    this.flightDirection,
    this.flightName,
    this.flightNumber,
    this.gate,
    this.pier,
    this.id,
    this.mainFlight,
    this.prefixIata,
    this.prefixIcao,
    this.airlineCode,
    this.publicEstimatedOffBlockTime,
    this.publicFlightState,
    this.route,
    this.scheduleDateTime,
    this.scheduleDate,
    this.scheduleTime,
    this.serviceType,
    this.terminal,
    this.transferPositions,
    this.schemaVersion,
  });

  factory Flight.fromJson(Map<String, dynamic> json) => new Flight(
        lastUpdatedAt: DateTime.parse(json["lastUpdatedAt"]),
        actualLandingTime: json["actualLandingTime"] == null
            ? null
            : DateTime.parse(json["actualLandingTime"]),
        actualOffBlockTime: json["actualOffBlockTime"] == null
            ? null
            : DateTime.parse(json["actualOffBlockTime"]),
        aircraftRegistration: json["aircraftRegistration"],
        aircraftType: AircraftType.fromJson(json["aircraftType"]),
        baggageClaim: json["baggageClaim"] == null
            ? null
            : BaggageClaim.fromJson(json["baggageClaim"]),
        checkinAllocations: json["checkinAllocations"] == null
            ? null
            : CheckinAllocations.fromJson(json["checkinAllocations"]),
        codeshares: json["codeshares"] == null
            ? null
            : Codeshares.fromJson(json["codeshares"]),
        estimatedLandingTime: json["estimatedLandingTime"] == null
            ? null
            : DateTime.parse(json["estimatedLandingTime"]),
        expectedTimeBoarding: json["expectedTimeBoarding"],
        expectedTimeGateClosing: json["expectedTimeGateClosing"],
        expectedTimeGateOpen: json["expectedTimeGateOpen"],
        expectedTimeOnBelt: json["expectedTimeOnBelt"] == null
            ? null
            : DateTime.parse(json["expectedTimeOnBelt"]),
        expectedSecurityFilter: json["expectedSecurityFilter"] == null
            ? null
            : json["expectedSecurityFilter"],
        flightDirection: flightDirectionValues.map[json["flightDirection"]],
        flightName: json["flightName"],
        flightNumber: json["flightNumber"],
        gate: json["gate"] == null ? null : json["gate"],
        pier: json["pier"] == null ? null : pierValues.map[json["pier"]],
        id: json["id"],
        mainFlight: json["mainFlight"],
        prefixIata: json["prefixIATA"],
        prefixIcao: json["prefixICAO"],
        airlineCode: json["airlineCode"],
        publicEstimatedOffBlockTime: json["publicEstimatedOffBlockTime"],
        publicFlightState:
            PublicFlightState.fromJson(json["publicFlightState"]),
        route: Route.fromJson(json["route"]),
        scheduleDateTime: DateTime.parse(json["scheduleDateTime"]),
        scheduleDate: DateTime.parse(json["scheduleDate"]),
        scheduleTime: json["scheduleTime"],
        serviceType: serviceTypeValues.map[json["serviceType"]],
        terminal: json["terminal"] == null ? null : json["terminal"],
        transferPositions: json["transferPositions"] == null
            ? null
            : TransferPositions.fromJson(json["transferPositions"]),
        schemaVersion: json["schemaVersion"],
      );

  Map<String, dynamic> toJson() => {
        "lastUpdatedAt": lastUpdatedAt.toIso8601String(),
        "actualLandingTime": actualLandingTime == null
            ? null
            : actualLandingTime.toIso8601String(),
        "actualOffBlockTime": actualOffBlockTime == null
            ? null
            : actualOffBlockTime.toIso8601String(),
        "aircraftRegistration": aircraftRegistration,
        "aircraftType": aircraftType.toJson(),
        "baggageClaim": baggageClaim == null ? null : baggageClaim.toJson(),
        "checkinAllocations":
            checkinAllocations == null ? null : checkinAllocations.toJson(),
        "codeshares": codeshares == null ? null : codeshares.toJson(),
        "estimatedLandingTime": estimatedLandingTime == null
            ? null
            : estimatedLandingTime.toIso8601String(),
        "expectedTimeBoarding": expectedTimeBoarding,
        "expectedTimeGateClosing": expectedTimeGateClosing,
        "expectedTimeGateOpen": expectedTimeGateOpen,
        "expectedTimeOnBelt": expectedTimeOnBelt == null
            ? null
            : expectedTimeOnBelt.toIso8601String(),
        "expectedSecurityFilter":
            expectedSecurityFilter == null ? null : expectedSecurityFilter,
        "flightDirection": flightDirectionValues.reverse[flightDirection],
        "flightName": flightName,
        "flightNumber": flightNumber,
        "gate": gate == null ? null : gate,
        "pier": pier == null ? null : pierValues.reverse[pier],
        "id": id,
        "mainFlight": mainFlight,
        "prefixIATA": prefixIata,
        "prefixICAO": prefixIcao,
        "airlineCode": airlineCode,
        "publicEstimatedOffBlockTime": publicEstimatedOffBlockTime,
        "publicFlightState": publicFlightState.toJson(),
        "route": route.toJson(),
        "scheduleDateTime": scheduleDateTime.toIso8601String(),
        "scheduleDate":
            "${scheduleDate.year.toString().padLeft(4, '0')}-${scheduleDate.month.toString().padLeft(2, '0')}-${scheduleDate.day.toString().padLeft(2, '0')}",
        "scheduleTime": scheduleTime,
        "serviceType": serviceTypeValues.reverse[serviceType],
        "terminal": terminal == null ? null : terminal,
        "transferPositions":
            transferPositions == null ? null : transferPositions.toJson(),
        "schemaVersion": schemaVersion,
      };
}

class AircraftType {
  String iataMain;
  String iataSub;

  AircraftType({
    this.iataMain,
    this.iataSub,
  });

  factory AircraftType.fromJson(Map<String, dynamic> json) => new AircraftType(
        iataMain: json["iataMain"],
        iataSub: json["iataSub"],
      );

  Map<String, dynamic> toJson() => {
        "iataMain": iataMain,
        "iataSub": iataSub,
      };
}

class BaggageClaim {
  List<String> belts;

  BaggageClaim({
    this.belts,
  });

  factory BaggageClaim.fromJson(Map<String, dynamic> json) => new BaggageClaim(
        belts: new List<String>.from(json["belts"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "belts": new List<dynamic>.from(belts.map((x) => x)),
      };
}

class CheckinAllocations {
  List<CheckinAllocation> checkinAllocations;
  dynamic remarks;

  CheckinAllocations({
    this.checkinAllocations,
    this.remarks,
  });

  factory CheckinAllocations.fromJson(Map<String, dynamic> json) =>
      new CheckinAllocations(
        checkinAllocations: new List<CheckinAllocation>.from(
            json["checkinAllocations"]
                .map((x) => CheckinAllocation.fromJson(x))),
        remarks: json["remarks"],
      );

  Map<String, dynamic> toJson() => {
        "checkinAllocations":
            new List<dynamic>.from(checkinAllocations.map((x) => x.toJson())),
        "remarks": remarks,
      };
}

class CheckinAllocation {
  DateTime endTime;
  Rows rows;
  DateTime startTime;

  CheckinAllocation({
    this.endTime,
    this.rows,
    this.startTime,
  });

  factory CheckinAllocation.fromJson(Map<String, dynamic> json) =>
      new CheckinAllocation(
        endTime: DateTime.parse(json["endTime"]),
        rows: Rows.fromJson(json["rows"]),
        startTime: DateTime.parse(json["startTime"]),
      );

  Map<String, dynamic> toJson() => {
        "endTime": endTime.toIso8601String(),
        "rows": rows.toJson(),
        "startTime": startTime.toIso8601String(),
      };
}

class Rows {
  List<Rowss> rows;

  Rows({
    this.rows,
  });

  factory Rows.fromJson(Map<String, dynamic> json) => new Rows(
        rows: new List<Rowss>.from(json["rows"].map((x) => Rowss.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rows": new List<dynamic>.from(rows.map((x) => x.toJson())),
      };
}

class Rowss {
  String position;
  Desks desks;

  Rowss({
    this.position,
    this.desks,
  });

  factory Rowss.fromJson(Map<String, dynamic> json) => new Rowss(
        position: json["position"],
        desks: Desks.fromJson(json["desks"]),
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "desks": desks.toJson(),
      };
}

class Desks {
  List<Desk> desks;

  Desks({
    this.desks,
  });

  factory Desks.fromJson(Map<String, dynamic> json) => new Desks(
        desks: new List<Desk>.from(json["desks"].map((x) => Desk.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "desks": new List<dynamic>.from(desks.map((x) => x.toJson())),
      };
}

class Desk {
  CheckinClass checkinClass;
  int position;

  Desk({
    this.checkinClass,
    this.position,
  });

  factory Desk.fromJson(Map<String, dynamic> json) => new Desk(
        checkinClass: json["checkinClass"] == null
            ? null
            : CheckinClass.fromJson(json["checkinClass"]),
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "checkinClass": checkinClass == null ? null : checkinClass.toJson(),
        "position": position,
      };
}

class CheckinClass {
  String code;
  String description;

  CheckinClass({
    this.code,
    this.description,
  });

  factory CheckinClass.fromJson(Map<String, dynamic> json) => new CheckinClass(
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "description": description,
      };
}

class Codeshares {
  List<String> codeshares;

  Codeshares({
    this.codeshares,
  });

  factory Codeshares.fromJson(Map<String, dynamic> json) => new Codeshares(
        codeshares: new List<String>.from(json["codeshares"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "codeshares": new List<dynamic>.from(codeshares.map((x) => x)),
      };
}

enum FlightDirection { D, A }

final flightDirectionValues =
    new EnumValues({"A": FlightDirection.A, "D": FlightDirection.D});

enum Pier { D, G, E, C }

final pierValues =
    new EnumValues({"C": Pier.C, "D": Pier.D, "E": Pier.E, "G": Pier.G});

class PublicFlightState {
  List<FlightState> flightStates;

  PublicFlightState({
    this.flightStates,
  });

  factory PublicFlightState.fromJson(Map<String, dynamic> json) =>
      new PublicFlightState(
        flightStates: new List<FlightState>.from(
            json["flightStates"].map((x) => flightStateValues.map[x])),
      );

  Map<String, dynamic> toJson() => {
        "flightStates": new List<dynamic>.from(
            flightStates.map((x) => flightStateValues.reverse[x])),
      };
}

enum FlightState { DEP, ARR, EXP }

final flightStateValues = new EnumValues(
    {"ARR": FlightState.ARR, "DEP": FlightState.DEP, "EXP": FlightState.EXP});

class Route {
  List<String> destinations;
  Eu eu;
  bool visa;

  Route({
    this.destinations,
    this.eu,
    this.visa,
  });

  factory Route.fromJson(Map<String, dynamic> json) => new Route(
        destinations: new List<String>.from(json["destinations"].map((x) => x)),
        eu: euValues.map[json["eu"]],
        visa: json["visa"],
      );

  Map<String, dynamic> toJson() => {
        "destinations": new List<dynamic>.from(destinations.map((x) => x)),
        "eu": euValues.reverse[eu],
        "visa": visa,
      };
}

enum Eu { N, S }

final euValues = new EnumValues({"N": Eu.N, "S": Eu.S});

enum ServiceType { F, J }

final serviceTypeValues =
    new EnumValues({"F": ServiceType.F, "J": ServiceType.J});

class TransferPositions {
  List<int> transferPositions;

  TransferPositions({
    this.transferPositions,
  });

  factory TransferPositions.fromJson(Map<String, dynamic> json) =>
      new TransferPositions(
        transferPositions:
            new List<int>.from(json["transferPositions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "transferPositions":
            new List<dynamic>.from(transferPositions.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
