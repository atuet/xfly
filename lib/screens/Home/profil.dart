import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';
import 'package:xfly/components/Buttons/roundedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Login/index.dart';

class ProfileScreen extends StatefulWidget {
  @override
  ProfileScreenState createState() => new ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final scrollController = new ScrollController();

  Future<List<String>> fetchInfos() async {
    var id_membre = await getIdPref();
    final response = await http.get(
      'http://tuet.fr:3000/membres/$id_membre?token=C1RBRmuhHe1HCkKROBXuvFbXFrpG2VZW',
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body)[0];
      var nom = jsonData["nom_membre"];
      var prenom = jsonData["prenom_membre"];
      var date = jsonData["date_naiss_membre"];
      print(nom + prenom + date);
      var infos = new List<String>();
      infos.add(nom);
      infos.add(prenom);
      infos.add(date);
      return infos;
    } else {
      throw Exception('Erreur dans le chargement de la liste');
    }
  }

  var deconnexion = <String, WidgetBuilder>{
    "/Deconnexion": (BuildContext context) => new LoginScreen()
  };

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        // return object of type Dialog
        return new CupertinoAlertDialog(
          title: new Text("Déconnexion"),
          content: new Text("Êtes-vous sur de vouloir vous déconnecter ?"),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("OUI"),
              onPressed: () {
                clearIdPref().then((bool committed) {
                  // Navigator.of(context).pushNamedAndRemoveUntil(
                  //     '/Deconnexion', (Route<dynamic> route) => false);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    ModalRoute.withName('/'),
                  );
                });
              },
            ),
            CupertinoDialogAction(
              child: Text("NON"),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop("Discard");
              },
            )
          ],
        );
      },
    );
  }

  @override
  String nom = "Nom";
  String prenom = "Prénom";
  String dateNaiss = "00/00/0000";
  void initState() {
    super.initState();
    fetchInfos().then((result) {
      print(result);
      setState(() {
        nom = "Nom : " + result[0];
        prenom = "Prénom : " + result[1];
        dateNaiss = "Date Naissance : " + result[2];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.only(bottom: 70.0, top: 20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  "PROFIL",
                  style: new TextStyle(
                      fontSize: 35.0, color: Color.fromRGBO(186, 36, 54, 1)),
                ),
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Container(
                            margin: EdgeInsets.only(top: 40.0),
                            child: Center(
                              child: Image.asset(
                                'assets/pdp.png',
                                width: 140.0,
                                height: 140.0,
                              ),
                            ))),
                    Expanded(
                      flex: 2,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Text(
                                nom,
                                style: new TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromRGBO(59, 59, 61, 1)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Text(
                                prenom,
                                style: new TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromRGBO(59, 59, 61, 1)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Text(
                                dateNaiss,
                                style: new TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromRGBO(59, 59, 61, 1)),
                              ),
                            ),
                          ]),
                    )
                  ]),
              Container(
                margin: EdgeInsets.only(top: 80),
                child: Center(
                  child: RoundedButton(
                    buttonName: "Deconnexion",
                    onTap: () {
                      _showDialog();
                    },
                    width: screenSize.width - 30,
                    height: 50.0,
                    bottomMargin: 10.0,
                    borderWidth: 0.0,
                    buttonColor: Color.fromRGBO(186, 36, 54, 1),
                  ),
                ),
              ),
            ]));
  }
}

Future<bool> clearIdPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  return prefs.commit();
}

Future<dynamic> getIdPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var id = prefs.getInt("id");
  return id;
}
