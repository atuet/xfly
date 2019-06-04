import 'package:flutter/material.dart';
import '../accueil/prochains_vols.dart';
import '../accueil/aeroports.dart';
import '../accueil/badge.dart';
import '../accueil/retard.dart';

class AccueilWidget extends StatelessWidget {
  final scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Carte affichant la section mes prochains vols
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProchainsVols()),
                );
              },
              child: Card(
                elevation: 1.0,
                color: Colors.white,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // On divise la carte en 2 pour afficher le texte a gauche
                    // et l'icon a droite (un expanded chacun)
                    Expanded(
                        flex: 3,
                        child: Container(
                          width: 100.0,
                          height: 120.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 30.0, top: 5.0, bottom: 5.0),
                                  child: Text(
                                    'Mes prochains Vols',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(186, 36, 54, 1)),
                                    textAlign: TextAlign.left,
                                  )),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 35.0),
                              child: Icon(Icons.flight_takeoff, size: 50),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),

            // Carte qui sert aux informations aéroport
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Aeroports()),
                );
              },
              child: Card(
                elevation: 1.0,
                color: Colors.white,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        flex: 3,
                        child: Container(
                          width: 100.0,
                          height: 120.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 30.0, top: 5.0, bottom: 5.0),
                                  child: Text(
                                    'Info. Aéroports',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(186, 36, 54, 1)),
                                    textAlign: TextAlign.left,
                                  )),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 35.0),
                              child: Icon(Icons.airplanemode_active, size: 50),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),

            // Carte qui sert au bage dématérialisé
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Badge(),
                    ));
              },
              child: Card(
                elevation: 1.0,
                color: Colors.white,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        flex: 3,
                        child: Container(
                          width: 100.0,
                          height: 120.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 30.0, top: 5.0, bottom: 5.0),
                                  child: Text(
                                    'Badge Dématérialisé',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(186, 36, 54, 1)),
                                    textAlign: TextAlign.left,
                                  )),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 35.0),
                              child: Icon(Icons.account_box, size: 50),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),

            // Carte VIDE
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => Vide()),
            //     );
            //   },
            //   child: Card(
            //     elevation: 1.0,
            //     color: Colors.white,
            //     margin:
            //         const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         Expanded(
            //             flex: 3,
            //             child: Container(
            //               width: 100.0,
            //               height: 120.0,
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: <Widget>[
            //                   Container(
            //                       margin: const EdgeInsets.only(
            //                           left: 30.0, top: 5.0, bottom: 5.0),
            //                       child: Text(
            //                         'VIDE',
            //                         style: TextStyle(
            //                             fontSize: 20.0,
            //                             fontWeight: FontWeight.bold,
            //                             color: Color.fromRGBO(186, 36, 54, 1)),
            //                         textAlign: TextAlign.left,
            //                       )),
            //                 ],
            //               ),
            //             )),
            //         Expanded(
            //             flex: 1,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: <Widget>[
            //                 Container(
            //                   margin: const EdgeInsets.only(top: 35.0),
            //                   child: Icon(Icons.access_alarms, size: 50),
            //                 )
            //               ],
            //             )),
            //       ],
            //     ),
            //   ),
            // ),
          ]),
    );
  }
}

// Container(
//   margin: const EdgeInsets.only(bottom: 70.0, top: 20.0),
//   child: Center(
//     child: Text(
//       "ACCUEIL",
//       style: new TextStyle(
//           fontSize: 35.0, color: Color.fromRGBO(186, 36, 54, 1)),
//     ),
//   ),
// ),
