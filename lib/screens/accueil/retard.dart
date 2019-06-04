import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

class Retard extends StatefulWidget {
  const Retard({Key key, this.idVol}) : super(key: key);

  final idVol;

  @override
  RetardState createState() => new RetardState();
}

class RetardState extends State<Retard> {
  Future<List<String>> fetchVols() async {
    final response = await http.get(
      'http://tuet.fr:3000/membres/3?token=C1RBRmuhHe1HCkKROBXuvFbXFrpG2VZW',
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body)[0];
      var idVol = jsonData["id_vol"];
      var numVol = jsonData["num_vol"];
      var aeroDepart = jsonData["aero_depart"];
      var aeroArrive = jsonData["aero_arrive"];
      var heureDepart = jsonData["heure_depart"];
      var heureArrive = jsonData["heure_arrive"];
      var estimation = jsonData["estimation"];
      var infos = new List<dynamic>();
      infos.add(idVol);
      infos.add(numVol);
      infos.add(aeroDepart);
      infos.add(aeroArrive);
      infos.add(heureDepart);
      infos.add(heureArrive);
      infos.add(estimation);
      return infos;
    } else {
      throw Exception('Erreur dans le chargement de la liste');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        // Partie Haute de l'application avec le nom
        appBar: AppBar(
          title: Text('Vide'),
          backgroundColor: Color.fromRGBO(186, 36, 54, 1),
        ),
        body: new Container(
          margin: EdgeInsets.only(bottom: 100),
          child: Center(
            child: Text("data"),
          ),
        ));
  }
}
