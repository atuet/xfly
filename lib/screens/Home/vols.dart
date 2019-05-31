import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:xfly/Model/model3.dart';
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';

String app_id = "91aad82e";
String app_key = "5fddf1b66d46cfa6ba42f1b906c57cee";
// String scheduledate = '2018-10-30';
String scheduledate = formatDate(new DateTime.now(), [yyyy, '-', mm, '-', dd]);

Future<List<Flight>> fetchFlights() async {
  final response = await http.get(
      'https://api.schiphol.nl/public-flights/flights?scheduledate=$scheduledate&includedelays=false&page=0&sort=%2BscheduleTime&flightDirection=D',
      headers: {
        "Accept": "application/json",
        "app_id": app_id,
        "app_key": app_key,
        "ResourceVersion": "v4"
      });
  if (response.statusCode == 200) {
    List flights = json.decode(response.body)['flights'];
    return flights.map((flights) => new Flight.fromJson(flights)).toList();
  } else {
    throw Exception('Erreur dans le chargement de la liste');
  }
}

Future<List<Flight>> fetchFlights2(page) async {
  final response = await http.get(
      // &flightdirection=D
      'https://api.schiphol.nl/public-flights/flights?app_id=$app_id&app_key=$app_key&scheduledate=$scheduledate&includedelays=false&page=$page&sort=%2Bscheduletime',
      headers: {"ResourceVersion": "v3"});
  if (response.statusCode == 200) {
    List flights = json.decode(response.body)['flights'];
    return flights.map((flights) => new Flight.fromJson(flights)).toList();
  } else {
    throw Exception('Erreur dans le chargement de la liste');
  }
}

class VolsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VolsScreenState();
//  Widget build(BuildContext context) {
//    return Container(
//      child: new Text('Vols'),
//    );
//  }
}

class VolsScreenState extends State<VolsWidget> {
  final scrollController = new ScrollController();
  bool isLoading = false;

  var list_flights;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  String now = formatDate(new DateTime.now(), [dd, '/', mm, '/', yyyy]);

  @override
  void initState() {
    super.initState();
    refreshListFlight();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        loadMore();
        log('test');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: RefreshIndicator(
          key: refreshKey,
          child: FutureBuilder<List<Flight>>(
            future: list_flights,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                List<Flight> flights = snapshot.data;
                return new ListView(
                    controller: scrollController,
                    children: flights
                        .map((flights) => GestureDetector(
                              onTap: () {
                                // Plus tard
                              },
                              child: Card(
                                elevation: 1.0,
                                color: Colors.white,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 14.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                      // margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                      width: 100.0,
                                      height: 120.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Text(
                                              now,
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Color.fromRGBO(
                                                      59, 59, 61, 1)),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  left: 15.0,
                                                  top: 5.0,
                                                  bottom: 5.0),
                                              child: Text(
                                                '${(heure(flights.scheduleTime))}',
                                                style: TextStyle(
                                                    fontSize: 28.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromRGBO(
                                                        186, 36, 54, 1)),
                                                textAlign: TextAlign.left,
                                              )),
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Text(
                                                '${(flights.route.destinations).toString().substring(1, 4)}',
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Color.fromRGBO(
                                                        59, 59, 61, 1)),
                                                textAlign: TextAlign.left,
                                              ))
                                        ],
                                      ),
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: <Widget>[
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 18.0, bottom: 10.0),
                                          child: Center(
                                            child: Text(
                                                '${(flights.flightName)}',
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/avion.png',
                                          width: 40.0,
                                        ),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Center(
                                                child: Text(
                                              '${(estimation(flights.estimatedLandingTime, flights.actualLandingTime, flights.actualOffBlockTime))}',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Color.fromRGBO(
                                                      59, 59, 61, 1)),
                                              textAlign: TextAlign.center,
                                            )))
                                      ],
                                    )),
                                    Expanded(
                                        child: Container(
                                      // margin: const EdgeInsets.symmetric(horizontal: 2.0),
                                      width: 100.0,
                                      height: 120.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 15.0),
                                                  child: Text(
                                                    now,
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: Color.fromRGBO(
                                                            59, 59, 61, 1)),
                                                    textAlign: TextAlign.right,
                                                  ))),
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 15.0,
                                                      top: 5.0,
                                                      bottom: 5.0),
                                                  child: Text(
                                                    '${(heure(flights.scheduleTime))}',
                                                    style: TextStyle(
                                                        fontSize: 28.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromRGBO(
                                                            186, 36, 54, 1)),
                                                    textAlign: TextAlign.right,
                                                  ))),
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 15.0),
                                                  child: Text(
                                                    '${(flights.route.destinations).toString().substring(1, 4)}',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: Color.fromRGBO(
                                                            59, 59, 61, 1)),
                                                    textAlign: TextAlign.right,
                                                  )))
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            ))
                        .toList());
              }
              return CircularProgressIndicator();
            },
          ),
          onRefresh: refreshListFlight),
    );
  }

  Future<Null> refreshListFlight() async {
    refreshKey.currentState?.show(atTop: false);
    await new Future.delayed(const Duration(seconds: 1));
    setState(() {
      list_flights = fetchFlights();
    });

    return null;
  }

  loadMore() async {
    if (!isLoading) {
      setState(() => isLoading = true);
      var page = 2;
      var newFlights = await fetchFlights2(page);

      list_flights.addAll(newFlights);
      isLoading = false;
      setState(() {});
    }
  }

  String estimation(estimationAtterissage, actualAtterissage, actualDecolage) {
    if (actualAtterissage == null) {
      if (estimationAtterissage == null) {
        if (actualDecolage == null) {
          return "";
        } else {
          return "Décollé à " + actualDecolage.toString().substring(11, 16);
        }
      } else {
        return "Arrivé estimée à " +
            estimationAtterissage.toString().substring(11, 16);
      }
    } else {
      return "Arrivé à " + actualAtterissage.toString().substring(11, 16);
    }
  }

  String heure(heure) {
    return heure.toString().substring(0, 5);
  }

  // Future<Null> refreshListFlight2() async {
  //   refreshKey.currentState?.show(atTop: false);
  //   await new Future.delayed(const Duration(seconds : 1));
  //   setState(() {
  //     list_flights = fetchFlights2();
  //   });

  //   return null;
  // }
}
