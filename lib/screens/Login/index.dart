import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xfly/theme/style.dart';
import 'style.dart';
import 'package:xfly/components/TextFields/inputField.dart';
import 'package:xfly/components/Buttons/textButton.dart';
import 'package:xfly/components/Buttons/roundedButton.dart';
import 'package:xfly/services/validations.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  // Création de variables de contrôle pour gérer le format de la page
  BuildContext context;
  final TextEditingController _controller = new TextEditingController();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController scrollController = new ScrollController();
  bool autovalidate = false;
  Validations validations = new Validations();

  _onPressed() {
    print("button clicked");
  }

  // Fonction permettant de changer de page vers celle qui est
  // passée en parametre
  onPressed(String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  void checkLog() async {
    var token = await getIdPref();
    print(token);
    if (!["", null, false, 0].contains(token)) {
      Navigator.pushReplacementNamed(context, "/HomePage");
    }
  }

  final idController = new TextEditingController();
  final passController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    checkLog();
  }

  // Partie majeure de la page
  @override
  Widget build(BuildContext context) {
    this.context = context;
    final Size screenSize = MediaQuery.of(context).size;
    Validations validations = new Validations();

    return new Scaffold(
        key: _scaffoldKey,
        body: new Container(
            // Marges de tout les côtés de 16 pixels
            padding: new EdgeInsets.all(25.0),
            // Image de backGround
            decoration: new BoxDecoration(image: backgroundImage),
            child: new GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: new SingleChildScrollView(
                  controller: scrollController,
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        height: screenSize.height - 50,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Affiche le Logo de l'application
                            new Center(
                                child: new Image(
                              image: logo,
                              width: (screenSize.width < 500)
                                  ? 280.0
                                  : (screenSize.width / 4) + 12.0,
                              height: screenSize.height / 4 + 20,
                            )),

                            // Affiche le Texte X-FLY au milieu de la page
                            new Container(
                                margin: const EdgeInsets.only(
                                    bottom: 70.0, top: 10.0),
                                alignment: new Alignment(0.0, -1.0),
                                child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Text(
                                        'X-',
                                        style: new TextStyle(
                                            fontSize: 70.0,
                                            color:
                                                Color.fromRGBO(59, 59, 61, 1)),
                                      ),
                                      new Text(
                                        'FLY',
                                        style: new TextStyle(
                                            fontSize: 50.0,
                                            color:
                                                Color.fromRGBO(186, 36, 54, 1)),
                                      )
                                    ])),

                            // Contient les champs identifiant, mot de passe
                            // et le bouton valider
                            new Container(
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // Création formulaire
                                  new Form(
                                    key: formKey,
                                    autovalidate: autovalidate,
                                    child: new Column(
                                      children: <Widget>[
                                        // Champ identifiant
                                        new InputField(
                                            controllerAction: idController,
                                            hintText: "Identifiant",
                                            hintStyle: hintStyle,
                                            obscureText: false,
                                            textInputType: TextInputType.text,
                                            textStyle: textStyle,
                                            textInputAction2:
                                                TextInputAction.next,
                                            textFieldColor: textFieldColor,
                                            icon: Icons.vpn_key,
                                            iconColor: Colors.grey,
                                            bottomMargin: 20.0,
                                            onSaved: (String email) {}),

                                        // Champ Mot de passe
                                        new InputField(
                                            controllerAction: passController,
                                            hintText: "Mot De Passe",
                                            hintStyle: hintStyle,
                                            obscureText: true,
                                            textInputAction2:
                                                TextInputAction.done,
                                            textInputType: TextInputType.text,
                                            textStyle: textStyle,
                                            textFieldColor: textFieldColor,
                                            icon: Icons.lock_open,
                                            iconColor: Colors.grey,
                                            bottomMargin: 30.0,
                                            validateFunction:
                                                validations.validatePassword,
                                            onSaved: (String password) {}),

                                        // Bouton Connexion
                                        new RoundedButton(
                                          buttonName: "Connexion",
                                          onTap: () {
                                            var username = idController.text;
                                            var password = passController.text;
                                            var url =
                                                'http://tuet.fr:3000/membres/users/auth?token=C1RBRmuhHe1HCkKROBXuvFbXFrpG2VZW&id=$username&password=$password';
                                            print(url);
                                            http.get(url).then((response) {
                                              print(
                                                  "Response status: ${response.statusCode}");
                                              print(
                                                  "Response body: ${response.body}");
                                              if (response.statusCode == 200) {
                                                Map<dynamic, dynamic> jsonData =
                                                    jsonDecode(
                                                        response.body)[0];
                                                //final jsonData = json.decode(response.body);
                                                //print(jsonData[0]);

                                                saveIdPref(
                                                        jsonData["id_membre"])
                                                    .then((bool committed) {
                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context, "/HomePage");
                                                });
                                              } else if (response.statusCode ==
                                                  404) {
                                                return showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          "Identifiant ou Mot de Passe Incorect !"),
                                                    );
                                                  },
                                                );
                                              }
                                            });
                                          },
                                          width: screenSize.width,
                                          height: 50.0,
                                          bottomMargin: 10.0,
                                          borderWidth: 0.0,
                                          buttonColor: primaryColor,
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Boutons A propos et Besoin d'aide
                                  // qui ne sont pas fonctionnels
                                  new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new TextButton(
                                          buttonName: "A propos",
                                          onPressed: _onPressed,
                                          buttonTextStyle: buttonTextStyle),
                                      new TextButton(
                                          buttonName: "Besoin d'aide ?",
                                          onPressed: _onPressed,
                                          buttonTextStyle: buttonTextStyle)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}

Future<bool> saveIdPref(int id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("id", id);
  return prefs.commit();
}

Future<dynamic> getIdPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var id = prefs.getInt("id");
  return id;
}

// var username = idController.text;
// var password = passController.text;
// var url = 'http://tuet.fr:3000/membres/users/auth?token=C1RBRmuhHe1HCkKROBXuvFbXFrpG2VZW&id=$username&password=$password';

// http.post(url).then((response) {
//     print(
//         "Response status: ${response.statusCode}");
//     print(
//         "Response body: ${response.body}");
//     if (response.statusCode == 200) {
//         Map < String, dynamic > jsonData =
//             jsonDecode(response.body[0]);
//         //final jsonData = json.decode(response.body);
//         print(jsonData["id_membre"]);

//         saveTokenPref(
//                 jsonData["id_membre"])
//             .then((bool committed) {
//                 Navigator
//                     .pushReplacementNamed(
//                         context, "/HomePage");
//             });
//     } else if (response.statusCode ==
//         400) {
//         return showDialog(
//             context: context,
//             builder: (context) {
//                 return AlertDialog(
//                     content: Text(
//                         "Identifiant ou Mot de Passe Incorect !"),
//                 );
//             },
//         );
// });
