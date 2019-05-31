import 'package:flutter/material.dart';

class AccueilWidget extends StatelessWidget {
  final scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
            Card(
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
                        // margin: const EdgeInsets.symmetric(horizontal: 2.0),
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
            Card(
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
                        // margin: const EdgeInsets.symmetric(horizontal: 2.0),
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
            Card(
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
                        // margin: const EdgeInsets.symmetric(horizontal: 2.0),
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
          ]),
    );
  }
}

// class Drawhorizontalline extends CustomPainter {

//   Paint _paint;
//   bool reverse;

//   Drawhorizontalline(this.reverse) {
// _paint = Paint()
// ..color = Colors.white
// ..strokeWidth = 0.5
// ..strokeCap = StrokeCap.round;
// }

//   @override
//   void paint(Canvas canvas, Size size) {
//     if(!reverse){
// canvas.drawLine(Offset(10.0, 0.0), Offset(90.0, 0.0), _paint);
// }
//     else
// {
// canvas.drawLine(Offset(-90.0, 0.0), Offset(-10.0, 0.0), _paint);
// }
// }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
// }

// }
