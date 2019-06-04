import "package:flutter/material.dart";
import 'package:xfly/Model/volsMembre.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../accueil/retard.dart';

class ProchainsVols extends StatefulWidget {
  const ProchainsVols({Key key}) : super(key: key);

  @override
  ProchainsVolsState createState() => new ProchainsVolsState();
}

Future<List<Vol>> fetchVols() async {
  var id_membre = await getIdPref();
  // Requuête HTTP
  final response = await http.get(
    'http://tuet.fr:3000/membres/vols/$id_membre?token=C1RBRmuhHe1HCkKROBXuvFbXFrpG2VZW',
  );

  // Si la réponse est reçue avec succès
  if (response.statusCode == 200) {
    // On décode la réponse renvoyée et on la transforme en liste de vols
    List vols = json.decode(response.body)['Vols'];
    return vols.map((vols) => new Vol.fromJson(vols)).toList();
  } else {
    // Sinon on renvoie une erreur
    throw Exception('Erreur dans le chargement de la liste');
  }
}

Future<dynamic> getIdPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var id = prefs.getInt("id");
  return id;
}

// Fichier qui va permettre de gérer les 3 pages de la page
// d'accueil
class ProchainsVolsState extends State<ProchainsVols> {
  final scrollController = new ScrollController();
  var list_vols;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  // Fonction qui va être executée au lancement de la page
  // ça va permettre de faire la requete a l'api pour récupérer
  // les vols et les afficher par la suite
  void initState() {
    super.initState();
    refreshListVols();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Mes Vols'),
          backgroundColor: Color.fromRGBO(186, 36, 54, 1),
        ),
        body: Center(
          // On affiche un loader tant que les informations ne sont pas chargées
          child: RefreshIndicator(
              key: refreshKey,
              child: FutureBuilder<List<Vol>>(
                future: list_vols,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    List<Vol> vol = snapshot.data;
                    return new ListView(
                        controller: scrollController,
                        children: vol
                            .map((vol) => GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed("/Retard",
                                        arguments: Retard(
                                          idVol: vol.idVol,
                                        ));
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
                                                  '${vol.dateDepart}',
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
                                                    '${vol.heureDepart}',
                                                    style: TextStyle(
                                                        fontSize: 28.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color.fromRGBO(
                                                            186, 36, 54, 1)),
                                                    textAlign: TextAlign.left,
                                                  )),

                                              // En dessous on affiche l'aeroport de provenance
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 15.0),
                                                  child: Text(
                                                    '${vol.aeroDepart}',
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
                                                child: Text('${(vol.numVol)}',
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
                                                  '${vol.estimation}',
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
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 15.0),
                                                      child: Text(
                                                        '${vol.dateArrive}',
                                                        style: TextStyle(
                                                            fontSize: 15.0,
                                                            color:
                                                                Color.fromRGBO(
                                                                    59,
                                                                    59,
                                                                    61,
                                                                    1)),
                                                        textAlign:
                                                            TextAlign.right,
                                                      ))),

                                              // L'heure d'arrivée
                                              Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 15.0,
                                                              top: 5.0,
                                                              bottom: 5.0),
                                                      child: Text(
                                                        '${vol.heureArrive}',
                                                        style: TextStyle(
                                                            fontSize: 28.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Color.fromRGBO(
                                                                    186,
                                                                    36,
                                                                    54,
                                                                    1)),
                                                        textAlign:
                                                            TextAlign.right,
                                                      ))),

                                              // L'aéroport d'arrivée
                                              Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 15.0),
                                                      child: Text(
                                                        '${vol.aeroArrive}',
                                                        style: TextStyle(
                                                            fontSize: 15.0,
                                                            color:
                                                                Color.fromRGBO(
                                                                    59,
                                                                    59,
                                                                    61,
                                                                    1)),
                                                        textAlign:
                                                            TextAlign.right,
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
              onRefresh: refreshListVols),
        ));
  }

  Future<Null> refreshListVols() async {
    refreshKey.currentState?.show(atTop: false);
    await new Future.delayed(const Duration(seconds: 1));
    setState(() {
      list_vols = fetchVols();
    });

    return null;
  }
}
