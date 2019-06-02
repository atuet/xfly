import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:xfly/Model/model3.dart';
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';

// app_id et app_key servent pour les appels a l'api
String app_id = "91aad82e";
String app_key = "5fddf1b66d46cfa6ba42f1b906c57cee";

// on prends la date du jour et on la formate au format voulu
String scheduledate = formatDate(new DateTime.now(), [yyyy, '-', mm, '-', dd]);

// Fonction qui permet d'appeler l'api pour récupérer
// la liste des vols du jour
Future<List<Flight>> fetchFlights() async {
  // Requuête HTTP
  final response = await http.get(
      'https://api.schiphol.nl/public-flights/flights?scheduledate=$scheduledate&includedelays=false&page=0&sort=%2BscheduleTime&flightDirection=D',
      headers: {
        "Accept": "application/json",
        "app_id": app_id,
        "app_key": app_key,
        "ResourceVersion": "v4"
      });

  // Si la réponse est reçue avec succès
  if (response.statusCode == 200) {
    // On décode la réponse renvoyée et on la transforme en liste de vols
    List flights = json.decode(response.body)['flights'];
    return flights.map((flights) => new Flight.fromJson(flights)).toList();
  } else {
    // Sinon on renvoie une erreur
    throw Exception('Erreur dans le chargement de la liste');
  }
}

class VolsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VolsScreenState();
}

class VolsScreenState extends State<VolsWidget> {
  final scrollController = new ScrollController();
  bool isLoading = false;

  var list_flights;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  String now = formatDate(new DateTime.now(), [dd, '/', mm, '/', yyyy]);

  @override
  // Fonction qui va être executée au lancement de la page
  // ça va permettre de faire la requete a l'api pour récupérer
  // les vols et les afficher par la suite
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
      // On affiche un loader tant que les informations ne sont pas chargées
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

                              // Pour chaque vol de la liste list_flights on
                              // effectue ceci :
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

                                            // On affiche la date en haut a Gauche (now est définie plus haut et
                                            // correspond a la date du jour)
                                            child: Text(
                                              now,
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Color.fromRGBO(
                                                      59, 59, 61, 1)),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),

                                          // En dessous, on affiche l'heure de départ de l'avion
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

                                          // En dessous on affiche l'aeroport de provenance
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Text(
                                                'AMS',
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Color.fromRGBO(
                                                        59, 59, 61, 1)),
                                                textAlign: TextAlign.left,
                                              ))
                                        ],
                                      ),
                                    )),

                                    // Sur la 2eme colone :
                                    Expanded(
                                        child: Column(
                                      children: <Widget>[
                                        // On affiche premierement le nom du vol
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

                                        // On affiche l'image d'avion
                                        Image.asset(
                                          'assets/avion.png',
                                          width: 40.0,
                                        ),

                                        // En dessous, on affiche l'estimation de l'heure de décollage
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

                                    // Sur la 3e colonne on affiche :
                                    Expanded(
                                        child: Container(
                                      width: 100.0,
                                      height: 120.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          // La date du jour
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

                                          // L'heure d'arrivée
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 15.0,
                                                      top: 5.0,
                                                      bottom: 5.0),
                                                  child: Text(
                                                    '${(addTime(heure(flights.scheduleTime)))}',
                                                    style: TextStyle(
                                                        fontSize: 28.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromRGBO(
                                                            186, 36, 54, 1)),
                                                    textAlign: TextAlign.right,
                                                  ))),

                                          // L'aéroport d'arrivée
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

  // Fonction appelée au debut de la page et qui permet de récupérer la
  // liste des vols par la fonction fetchFlights et qui va attribuer la
  // liste dans list_flights pour que ça puisse s'afficher
  Future<Null> refreshListFlight() async {
    refreshKey.currentState?.show(atTop: false);
    await new Future.delayed(const Duration(seconds: 1));
    setState(() {
      list_flights = fetchFlights();
    });

    return null;
  }

  // Fonction pour plus tard
  String addTime(time) {
    String heures = time.toString().substring(0, 2);
    String minutes = time.toString().substring(3, 5);

    var intHeures = int.tryParse(heures);
    var intMinutes = int.tryParse(minutes);

    intMinutes += 30;

    if (intMinutes >= 60) {
      intHeures++;
      intMinutes -= 60;

      if (intHeures >= 24) {
        intHeures -= 24;
      }
    }

    intHeures += 2;

    if (intHeures >= 24) {
      intHeures -= 24;
    }

    String heureFinale = '$intHeures';
    String minutesFinale = '$intMinutes';

    if (heureFinale.length == 1) {
      heureFinale = "0" + heureFinale;
    }
    if (minutesFinale.length == 1) {
      minutesFinale = "0" + minutesFinale;
    }

    return heureFinale + ":" + minutesFinale;
  }

  // Fonction pour plus tard
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

  // Fonction qui permet d'afficher correctement l'estimation d'heure de décollage
  // ou d'atterrisage
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

  // Fonction qui permet d'afficher correctement l'heure de départ et d'arrivée
  String heure(heure) {
    return heure.toString().substring(0, 5);
  }

  // Fonction pour plus tard
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

  // Future<Null> refreshListFlight2() async {
  //   refreshKey.currentState?.show(atTop: false);
  //   await new Future.delayed(const Duration(seconds : 1));
  //   setState(() {
  //     list_flights = fetchFlights2();
  //   });

  //   return null;
  // }
}
