import "package:flutter/material.dart";
import 'package:xfly/Model/airport.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Aeroports extends StatefulWidget {
  const Aeroports({Key key}) : super(key: key);

  @override
  AeroportsState createState() => new AeroportsState();
}

Future<List<Aeroport>> fetchAeroports() async {
  // Requuête HTTP
  final response = await http.get(
    'http://tuet.fr:3000/aeroports?token=C1RBRmuhHe1HCkKROBXuvFbXFrpG2VZW',
  );

  // Si la réponse est reçue avec succès
  if (response.statusCode == 200) {
    // On décode la réponse renvoyée et on la transforme en liste de vols
    List aeroports = json.decode(response.body)['Aeroports'];
    return aeroports
        .map((aeroports) => new Aeroport.fromJson(aeroports))
        .toList();
    // final airport = airportFromJson(response.body);
    // return airport;
  } else {
    // Sinon on renvoie une erreur
    throw Exception('Erreur dans le chargement de la liste');
  }
}

// Fichier qui va permettre de gérer les 3 pages de la page
// d'accueil
class AeroportsState extends State<Aeroports> {
  final scrollController = new ScrollController();
  var list_aero;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  // Fonction qui va être executée au lancement de la page
  // ça va permettre de faire la requete a l'api pour récupérer
  // les vols et les afficher par la suite
  void initState() {
    super.initState();
    refreshListAeroports();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Aéroports'),
          backgroundColor: Color.fromRGBO(186, 36, 54, 1),
        ),
        body: Center(
          // On affiche un loader tant que les informations ne sont pas chargées
          child: RefreshIndicator(
              key: refreshKey,
              child: FutureBuilder<List<Aeroport>>(
                future: list_aero,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    List<Aeroport> aero = snapshot.data;
                    return new ListView(
                        controller: scrollController,
                        children: aero
                            .map((aero) => GestureDetector(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                            flex: 1,
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
                                                    margin: EdgeInsets.only(
                                                        left: 30.0),
                                                    child: Image.asset(
                                                      'assets/airport.png',
                                                      width: 40.0,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )),

                                        // Sur la 2eme colone :
                                        Expanded(
                                            flex: 3,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                // On affiche premierement le nom du vol
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 21.0,
                                                      bottom: 7.0,
                                                      left: 10),
                                                  child: Text(
                                                      '${(aero.arpName)}',
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                // En dessous, on affiche l'estimation de l'heure de décollage
                                                Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 7.0, left: 10),
                                                    child: Text(
                                                      '${(aero.arpIataCode)} - ${(aero.arpCountryName)}',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Color.fromRGBO(
                                                              59, 59, 61, 1)),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ))
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList());
                  }
                  return CircularProgressIndicator();
                },
              ),
              onRefresh: refreshListAeroports),
        ));
  }

  Future<Null> refreshListAeroports() async {
    refreshKey.currentState?.show(atTop: false);
    await new Future.delayed(const Duration(seconds: 1));
    setState(() {
      list_aero = fetchAeroports();
    });

    return null;
  }
}
