// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) {
  final jsonData = json.decode(str);
  return Welcome.fromJson(jsonData);
}

String welcomeToJson(Welcome data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Welcome {
  List<Flight> flights;
  String schemaVersion;

  Welcome({
    this.flights,
    this.schemaVersion,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => new Welcome(
        flights: new List<Flight>.from(
            json["flights"].map((x) => Flight.fromJson(x))),
        schemaVersion: json["schemaVersion"],
      );

  Map<String, dynamic> toJson() => {
        "flights": new List<dynamic>.from(flights.map((x) => x.toJson())),
        "schemaVersion": schemaVersion,
      };
}

class Flight {
  String id;
  String flightName;
  String scheduleDate;
  FlightDirection flightDirection;
  int flightNumber;
  String prefixIata;
  String prefixIcao;
  String scheduleTime;
  ServiceType serviceType;
  String mainFlight;
  Codeshares codeshares;
  dynamic estimatedLandingTime;
  dynamic actualLandingTime;
  dynamic publicEstimatedOffBlockTime;
  String actualOffBlockTime;
  PublicFlightState publicFlightState;
  Route route;
  int terminal;
  String gate;
  dynamic baggageClaim;
  dynamic expectedTimeOnBelt;
  CheckinAllocations checkinAllocations;
  TransferPositions transferPositions;
  AircraftType aircraftType;
  String aircraftRegistration;
  int airlineCode;
  dynamic expectedTimeGateOpen;
  dynamic expectedTimeBoarding;
  dynamic expectedTimeGateClosing;
  String schemaVersion;

  Flight({
    this.id,
    this.flightName,
    this.scheduleDate,
    this.flightDirection,
    this.flightNumber,
    this.prefixIata,
    this.prefixIcao,
    this.scheduleTime,
    this.serviceType,
    this.mainFlight,
    this.codeshares,
    this.estimatedLandingTime,
    this.actualLandingTime,
    this.publicEstimatedOffBlockTime,
    this.actualOffBlockTime,
    this.publicFlightState,
    this.route,
    this.terminal,
    this.gate,
    this.baggageClaim,
    this.expectedTimeOnBelt,
    this.checkinAllocations,
    this.transferPositions,
    this.aircraftType,
    this.aircraftRegistration,
    this.airlineCode,
    this.expectedTimeGateOpen,
    this.expectedTimeBoarding,
    this.expectedTimeGateClosing,
    this.schemaVersion,
  });

  factory Flight.fromJson(Map<String, dynamic> json) => new Flight(
        id: json["id"],
        flightName: json["flightName"],
        scheduleDate: json["scheduleDate"],
        flightDirection: flightDirectionValues.map[json["flightDirection"]],
        flightNumber: json["flightNumber"],
        prefixIata: json["prefixIATA"] == null ? null : json["prefixIATA"],
        prefixIcao: json["prefixICAO"],
        scheduleTime: json["scheduleTime"],
        serviceType: json["serviceType"] == null
            ? null
            : serviceTypeValues.map[json["serviceType"]],
        mainFlight: json["mainFlight"],
        codeshares: json["codeshares"] == null
            ? null
            : Codeshares.fromJson(json["codeshares"]),
        estimatedLandingTime: json["estimatedLandingTime"],
        actualLandingTime: json["actualLandingTime"],
        publicEstimatedOffBlockTime: json["publicEstimatedOffBlockTime"],
        actualOffBlockTime: json["actualOffBlockTime"] == null
            ? null
            : json["actualOffBlockTime"],
        publicFlightState:
            PublicFlightState.fromJson(json["publicFlightState"]),
        route: Route.fromJson(json["route"]),
        terminal: json["terminal"] == null ? null : json["terminal"],
        gate: json["gate"] == null ? null : json["gate"],
        baggageClaim: json["baggageClaim"],
        expectedTimeOnBelt: json["expectedTimeOnBelt"],
        checkinAllocations: json["checkinAllocations"] == null
            ? null
            : CheckinAllocations.fromJson(json["checkinAllocations"]),
        transferPositions: json["transferPositions"] == null
            ? null
            : TransferPositions.fromJson(json["transferPositions"]),
        aircraftType: AircraftType.fromJson(json["aircraftType"]),
        aircraftRegistration: json["aircraftRegistration"],
        airlineCode: json["airlineCode"],
        expectedTimeGateOpen: json["expectedTimeGateOpen"],
        expectedTimeBoarding: json["expectedTimeBoarding"],
        expectedTimeGateClosing: json["expectedTimeGateClosing"],
        schemaVersion: json["schemaVersion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "flightName": flightName,
        "scheduleDate": scheduleDate,
        "flightDirection": flightDirectionValues.reverse[flightDirection],
        "flightNumber": flightNumber,
        "prefixIATA": prefixIata == null ? null : prefixIata,
        "prefixICAO": prefixIcao,
        "scheduleTime": scheduleTime,
        "serviceType":
            serviceType == null ? null : serviceTypeValues.reverse[serviceType],
        "mainFlight": mainFlight,
        "codeshares": codeshares == null ? null : codeshares.toJson(),
        "estimatedLandingTime": estimatedLandingTime,
        "actualLandingTime": actualLandingTime,
        "publicEstimatedOffBlockTime": publicEstimatedOffBlockTime,
        "actualOffBlockTime":
            actualOffBlockTime == null ? null : actualOffBlockTime,
        "publicFlightState": publicFlightState.toJson(),
        "route": route.toJson(),
        "terminal": terminal == null ? null : terminal,
        "gate": gate == null ? null : gate,
        "baggageClaim": baggageClaim,
        "expectedTimeOnBelt": expectedTimeOnBelt,
        "checkinAllocations":
            checkinAllocations == null ? null : checkinAllocations.toJson(),
        "transferPositions":
            transferPositions == null ? null : transferPositions.toJson(),
        "aircraftType": aircraftType.toJson(),
        "aircraftRegistration": aircraftRegistration,
        "airlineCode": airlineCode,
        "expectedTimeGateOpen": expectedTimeGateOpen,
        "expectedTimeBoarding": expectedTimeBoarding,
        "expectedTimeGateClosing": expectedTimeGateClosing,
        "schemaVersion": schemaVersion,
      };
}

class AircraftType {
  String iatamain;
  String iatasub;

  AircraftType({
    this.iatamain,
    this.iatasub,
  });

  factory AircraftType.fromJson(Map<String, dynamic> json) => new AircraftType(
        iatamain: json["iatamain"] == null ? null : json["iatamain"],
        iatasub: json["iatasub"] == null ? null : json["iatasub"],
      );

  Map<String, dynamic> toJson() => {
        "iatamain": iatamain == null ? null : iatamain,
        "iatasub": iatasub == null ? null : iatasub,
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
  String startTime;
  String endTime;
  Rows rows;

  CheckinAllocation({
    this.startTime,
    this.endTime,
    this.rows,
  });

  factory CheckinAllocation.fromJson(Map<String, dynamic> json) =>
      new CheckinAllocation(
        startTime: json["startTime"],
        endTime: json["endTime"],
        rows: Rows.fromJson(json["rows"]),
      );

  Map<String, dynamic> toJson() => {
        "startTime": startTime,
        "endTime": endTime,
        "rows": rows.toJson(),
      };
}

class Rows {
  List<Row2> rows;

  Rows({
    this.rows,
  });

  factory Rows.fromJson(Map<String, dynamic> json) => new Rows(
        rows: new List<Row2>.from(json["rows"].map((x) => Row2.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rows": new List<dynamic>.from(rows.map((x) => x.toJson())),
      };
}

class Row2 {
  String position;
  Desks desks;

  Row2({
    this.position,
    this.desks,
  });

  factory Row2.fromJson(Map<String, dynamic> json) => new Row2(
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
  int position;
  CheckinClass checkinClass;

  Desk({
    this.position,
    this.checkinClass,
  });

  factory Desk.fromJson(Map<String, dynamic> json) => new Desk(
        position: json["position"],
        checkinClass: CheckinClass.fromJson(json["checkinClass"]),
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "checkinClass": checkinClass.toJson(),
      };
}

class CheckinClass {
  FlightDirection code;
  Description description;

  CheckinClass({
    this.code,
    this.description,
  });

  factory CheckinClass.fromJson(Map<String, dynamic> json) => new CheckinClass(
        code: flightDirectionValues.map[json["code"]],
        description: descriptionValues.map[json["description"]],
      );

  Map<String, dynamic> toJson() => {
        "code": flightDirectionValues.reverse[code],
        "description": descriptionValues.reverse[description],
      };
}

enum FlightDirection { D, EMPTY, H, P, C, B, Y, S, E }

final flightDirectionValues = new EnumValues({
  "B": FlightDirection.B,
  "C": FlightDirection.C,
  "D": FlightDirection.D,
  "E": FlightDirection.E,
  "": FlightDirection.EMPTY,
  "H": FlightDirection.H,
  "P": FlightDirection.P,
  "S": FlightDirection.S,
  "Y": FlightDirection.Y
});

enum Description {
  EMPTY,
  ECONOMY_CLASS,
  BAGGAGE_DROP_OFF,
  SKY_PRIORITY,
  BUSINESS_CLASS,
  CHECK_IN,
  SERVICE_BALIE
}

final descriptionValues = new EnumValues({
  "Baggage drop-off": Description.BAGGAGE_DROP_OFF,
  "Business Class": Description.BUSINESS_CLASS,
  "Check-in": Description.CHECK_IN,
  "Economy Class": Description.ECONOMY_CLASS,
  "": Description.EMPTY,
  "Service balie": Description.SERVICE_BALIE,
  "Sky Priority": Description.SKY_PRIORITY
});

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

enum FlightState { DEP, SCH }

final flightStateValues =
    new EnumValues({"DEP": FlightState.DEP, "SCH": FlightState.SCH});

class Route {
  List<String> destinations;

  Route({
    this.destinations,
  });

  factory Route.fromJson(Map<String, dynamic> json) => new Route(
        destinations: new List<String>.from(json["destinations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "destinations": new List<dynamic>.from(destinations.map((x) => x)),
      };
}

enum ServiceType { J, P, F, C }

final serviceTypeValues = new EnumValues({
  "C": ServiceType.C,
  "F": ServiceType.F,
  "J": ServiceType.J,
  "P": ServiceType.P
});

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
