import "package:flutter/material.dart";
import 'package:xfly/components/qrcode.dart';
import 'package:qr/qr.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Badge extends StatefulWidget {
  const Badge({Key key}) : super(key: key);

  @override
  BadgeState createState() => new BadgeState();
}

// Fichier qui va permettre de gérer les 3 pages de la page
// d'accueil
class BadgeState extends State<Badge> {
  Future<List<String>> fetchInfos() async {
    var id_membre = await getIdPref();
    final response = await http.get(
      'http://tuet.fr:3000/membres/$id_membre?token=C1RBRmuhHe1HCkKROBXuvFbXFrpG2VZW',
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body)[0];
      var nom = jsonData["nom_membre"];
      var prenom = jsonData["prenom_membre"];
      print(nom + prenom);
      var infos = new List<String>();
      infos.add(nom);
      infos.add(prenom);
      return infos;
    } else {
      throw Exception('Erreur dans le chargement de la liste');
    }
  }

  @override
  QrImage qrcode;
  String texte = "nomprenom";
  void initState() {
    super.initState();
    fetchInfos().then((result) {
      print(result);
      setState(() {
        texte = result[0] + "-" + result[1];
        qrcode = new QrImage(
          data: texte,
          size: 270.0,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        // Partie Haute de l'application avec le nom
        appBar: AppBar(
          title: Text('Badge'),
          backgroundColor: Color.fromRGBO(186, 36, 54, 1),
        ),
        body: new Container(
          margin: EdgeInsets.only(bottom: 100),
          child: Center(
            child: qrcode,
          ),
        ));
  }
}

class QrImage extends StatelessWidget {
  QrImage({
    @required String data,
    this.size,
    this.padding = const EdgeInsets.all(10.0),
    this.backgroundColor,
    Color foregroundColor = const Color(0xFF000000),
    int version = 4,
    int errorCorrectionLevel = QrErrorCorrectLevel.L,
  }) : _painter =
            new QrPainter(data, foregroundColor, version, errorCorrectionLevel);

  final QrPainter _painter;
  final Color backgroundColor;
  final EdgeInsets padding;
  final double size;

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: size,
      height: size,
      color: backgroundColor,
      child: new Padding(
        padding: this.padding,
        child: new CustomPaint(
          painter: _painter,
        ),
      ),
    );
  }
}

Future<dynamic> getIdPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var id = prefs.getInt("id");
  return id;
}
