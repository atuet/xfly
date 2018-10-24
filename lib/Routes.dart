import 'package:flutter/material.dart';
import 'package:xfly/screens/Login/index.dart';
import 'package:xfly/screens/Home/index.dart';
import 'package:xfly/theme/style.dart';

class Routes {

  var routes = <String, WidgetBuilder>{
    "/HomePage": (BuildContext context) => new HomeScreen()
  };

  Routes() {
    runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Flat App",
      home: new LoginScreen(),
      theme: appTheme,
      routes: routes,
    ));
  }
}
