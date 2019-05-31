// class Codeshares
// {
//     final List<String> codeshares;
//     Codeshares({this.codeshares});

// }

// class PublicFlightState
// {
//     final List<String> flightStates;
//     PublicFlightState({this.flightStates});
// }

// class Route
// {
//     final List<String> destinations;
//     Route({this.destinations});

//     Route.fromJson(Map<String, dynamic> json)
//       : destinations = json['destinations'];

//   Map<String, dynamic> toJson() =>
//     {
//       'destinations': destinations,
//     };

//     // Route.fromJson(Map jsonMap)
//     // : destinations = jsonMap['destinations'];
// }

// class CheckinClass
// {
//     final String code;
//     final String description;
//     CheckinClass({this.code, this.description});
// }

// class Desk
// {
//     final int position;
//     final CheckinClass checkinClass;
//     Desk({this.position, this.checkinClass});
// }

// class Desks
// {
//     final List<Desk> desks;
//     Desks({this.desks});
// }

// class Row
// {
//     final String position;
//     final Desks desks;
//     Row({this.position, this.desks});
// }

// class Rows
// {
//     final List<Row> rows;
//     Rows({this.rows});
// }

// class CheckinAllocation
// {
//     final DateTime startTime;
//     final DateTime endTime;
//     final Rows rows;
//     CheckinAllocation({this.startTime, this.endTime, this.rows});
// }

// class CheckinAllocations
// {
//     final List<CheckinAllocation> checkinAllocations;
//     final Object remarks;
//     CheckinAllocations({this.checkinAllocations, this.remarks});
// }

// class TransferPositions
// {
//     final List<int> transferPositions;
//     TransferPositions({this.transferPositions});
// }

// class AircraftType
// {
//     final String iatamain;
//     final String iatasub;
//     AircraftType({this.iatamain, this.iatasub});
// }

// class Flight {
//   final Object id;
//   final String flightName;
//   final String scheduleDate;
//   final String flightDirection;
//   final int flightNumber;
//   final String prefixIATA;
//   final String prefixICAO;
//   final String scheduleTime;
//   final String serviceType;
//   final String mainFlight;
//   final Codeshares codeshares;
//   final Object estimatedLandingTime;
//   final Object actualLandingTime;
//   final Object finalEstimatedOffBlockTime;
//   final Object actualOffBlockTime;
//   final PublicFlightState finalFlightState;
//   final Route route;
//   final int terminal;
//   final String gate;
//   final Object baggageClaim;
//   final Object expectedTimeOnBelt;
//   final CheckinAllocations checkinAllocations;
//   final TransferPositions transferPositions;
//   final AircraftType aircraftType;
//   final String aircraftRegistration;
//   final int airlineCode;
//   final Object expectedTimeGateOpen;
//   final Object expectedTimeBoarding;
//   final Object expectedTimeGateClosing;
//   final String schemaVersion;

//   Flight({this.id, this.flightName, this.scheduleDate, this.flightDirection, this.flightNumber, this.prefixIATA, this.prefixICAO, this.scheduleTime, this.serviceType, this.mainFlight, this.codeshares, this.estimatedLandingTime, this.actualLandingTime, this.finalEstimatedOffBlockTime, this.actualOffBlockTime, this.finalFlightState, this.route, this.terminal, this.gate, this.baggageClaim, this.expectedTimeOnBelt, this.checkinAllocations, this.transferPositions, this.aircraftType, this.aircraftRegistration, this.airlineCode, this.expectedTimeGateOpen, this.expectedTimeBoarding, this.expectedTimeGateClosing, this.schemaVersion});

//   factory Flight.fromJson(Map<String, dynamic> json)
//   {
//     Route destinationmap = Map<String, dynamic> json;
//     var user = new User.fromJson(userMap);
//     return Flight(schemaVersion: json['schemaVersion'],
//     id: json['id'],
//     flightName: json['flightName'],
//     scheduleDate: json['scheduleDate'],
//     flightDirection: json['flightDirection'],
//     flightNumber: json['flightNumber'],
//     prefixIATA: json['prefixIATA'],
//     prefixICAO: json['prefixICAO'],
//     scheduleTime: json['scheduleTime'],
//     serviceType: json['serviceType'],
//     mainFlight: json['mainFlight'],
//     // codeshares: json['codeshares'],
//     estimatedLandingTime: json['estimatedLandingTime'],
//     actualLandingTime: json['actualLandingTime'],
//     finalEstimatedOffBlockTime: json['finalEstimatedOffBlockTime'],
//     actualOffBlockTime: json['actualOffBlockTime'],
//     finalFlightState: json['finalFlightState'],
//     route: (json['destinations'] as List).map((i) => Route.fromJson(i)).toList(),
//     terminal: json['terminal'],
//     gate: json['gate'],
//     baggageClaim: json['baggageClaim'],
//     expectedTimeOnBelt: json['expectedTimeOnBelt'],
//     // checkinAllocations: json['checkinAllocations'],
//     transferPositions: json['transferPositions'],
//     aircraftType: json['aircraftType'],
//     aircraftRegistration: json['aircraftRegistration'],
//     airlineCode: json['airlineCode'],
//     expectedTimeGateOpen: json['expectedTimeGateOpen'],
//     expectedTimeBoarding: json['expectedTimeBoarding'],
//     expectedTimeGateClosing: json['expectedTimeGateClosing']
//     );
//     }
// }

// class FlightApi {
//   final String schemaVersion;
//   final List<Flight> flights;

//   FlightApi({this.schemaVersion, this.flights});

//   factory FlightApi.fromJson(Map<String, dynamic> json)
//   {
//     return FlightApi(schemaVersion: json['schemaVersion'],
//     flights: (json['flights'] as List).map((flights)=> Flight.fromJson(flights)).toList());
//   }
// }
