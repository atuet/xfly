import 'package:flutter/material.dart';
import 'package:xfly/screens/Login/index.dart';
import 'package:xfly/screens/Home/index.dart';
import 'package:xfly/theme/style.dart';

class Routes {
  // Déclaration de certaines routes avec des noms
  // Ici, route Homepage
  var routes = <String, WidgetBuilder>{
    "/HomePage": (BuildContext context) => new HomeScreen()
  };

  // Constructeur de Route :
  // Crée une MaterialApp (application)
  // Titre : X-FLY
  // Home (Affichage principal de l'application) :
  // Redirige vers LoginScreen qui est la page de Login de l'utilisateur (Login/index.dart)
  Routes() {
    runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "X-FLY",
      home: new LoginScreen(),
      theme: appTheme,
      routes: routes,
    ));
  }
}
