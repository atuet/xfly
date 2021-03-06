import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  IconData icon;
  String hintText;
  TextInputType textInputType;
  Color textFieldColor, iconColor;
  bool obscureText;
  double bottomMargin;
  TextStyle textStyle, hintStyle;
  var validateFunction;
  var onSaved;
  Key key;
  TextInputAction textInputAction2;
  TextEditingController controllerAction;

  InputField(
      {this.key,
      this.hintText,
      this.obscureText,
      this.textInputType,
      this.textFieldColor,
      this.icon,
      this.iconColor,
      this.bottomMargin,
      this.textStyle,
      this.textInputAction2,
      this.validateFunction,
      this.onSaved,
      this.hintStyle,
      this.controllerAction});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (new Container(
        margin: new EdgeInsets.only(bottom: bottomMargin),
        child: new DecoratedBox(
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
              color: textFieldColor),
          child: new TextFormField(
            controller: controllerAction,
            style: textStyle,
            key: key,
            autocorrect: false,
            obscureText: obscureText,
            textInputAction: textInputAction2,
            keyboardType: textInputType,
            validator: validateFunction,
            onSaved: onSaved,
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: hintStyle,
              icon: new Icon(
                icon,
                color: iconColor,
              ),
            ),
          ),
        )));
  }
}
