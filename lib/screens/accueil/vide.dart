import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Vide extends StatefulWidget {
  const Vide({Key key}) : super(key: key);

  @override
  VideState createState() => new VideState();
}

// Fichier qui va permettre de gérer les 3 pages de la page
// d'accueil
class VideState extends State<Vide> {
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
