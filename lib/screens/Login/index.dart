import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xfly/theme/style.dart';
import 'style.dart';
import 'package:xfly/components/TextFields/inputField.dart';
import 'package:xfly/components/Buttons/textButton.dart';
import 'package:xfly/components/Buttons/roundedButton.dart';
import 'package:xfly/services/validations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
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

  onPressed(String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  void _handleSubmitted() {
    Navigator.pushReplacementNamed(context, "/HomePage");
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final Size screenSize = MediaQuery.of(context).size;
    //print(context.widget.toString());
    Validations validations = new Validations();
    return new Scaffold(
        key: _scaffoldKey,
        body: new Container(
            padding: new EdgeInsets.all(16.0),
            decoration: new BoxDecoration(image: backgroundImage),
            child: new GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: new Column(
                children: <Widget>[
                  new Container(
                    height: screenSize.height - 50,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Center(
                            child: new Image(
                          image: logo,
                          width: (screenSize.width < 500)
                              ? 280.0
                              : (screenSize.width / 4) + 12.0,
                          height: screenSize.height / 4 + 20,
                        )),
                        new Container(
                            margin:
                                const EdgeInsets.only(bottom: 70.0, top: 10.0),
                            alignment: new Alignment(0.0, -1.0),
                            child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Text(
                                    'X-',
                                    style: new TextStyle(
                                        fontSize: 70.0,
                                        color: Color.fromRGBO(59, 59, 61, 1)),
                                  ),
                                  new Text(
                                    'FLY',
                                    style: new TextStyle(
                                        fontSize: 50.0,
                                        color: Color.fromRGBO(186, 36, 54, 1)),
                                  )
                                ])),
                        new Container(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Form(
                                key: formKey,
                                autovalidate: autovalidate,
                                child: new Column(
                                  children: <Widget>[
                                    new InputField(
                                        hintText: "Identifiant",
                                        hintStyle: hintStyle,
                                        obscureText: false,
                                        textInputType: TextInputType.text,
                                        textStyle: textStyle,
                                        textInputAction2: TextInputAction.next,
                                        textFieldColor: textFieldColor,
                                        icon: Icons.vpn_key,
                                        iconColor: Colors.grey,
                                        bottomMargin: 20.0,
                                        onSaved: (String email) {}),
                                    new InputField(
                                        hintText: "Mot De Passe",
                                        hintStyle: hintStyle,
                                        obscureText: true,
                                        textInputAction2: TextInputAction.done,
                                        textInputType: TextInputType.text,
                                        textStyle: textStyle,
                                        textFieldColor: textFieldColor,
                                        icon: Icons.lock_open,
                                        iconColor: Colors.grey,
                                        bottomMargin: 30.0,
                                        validateFunction:
                                            validations.validatePassword,
                                        onSaved: (String password) {}),
                                    new RoundedButton(
                                      buttonName: "Connexion",
                                      onTap: _handleSubmitted,
                                      width: screenSize.width,
                                      height: 50.0,
                                      bottomMargin: 10.0,
                                      borderWidth: 0.0,
                                      buttonColor: primaryColor,
                                    ),
                                  ],
                                ),
                              ),
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
            )));
  }
}
