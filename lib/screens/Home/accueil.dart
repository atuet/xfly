import 'package:flutter/material.dart';

class AccueilWidget extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return Container(
    margin: const EdgeInsets.only(bottom: 70.0, top: 30.0),
    alignment: new Alignment(0.0, -1.0),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
                    elevation: 1.0,
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                        child: Container(
                          // margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          width: 100.0,
                          height: 120.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(left: 15.0),
                                child : Text("now",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(59, 59, 61, 1)
                                    ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
                                child : Text('Test',
                                  style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(186, 36, 54, 1)
                                    ),
                                  textAlign: TextAlign.left,
                                  )
                                ),
                              Container(
                                margin: const EdgeInsets.only(left: 15.0),
                                child : Text('test', 
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(59, 59, 61, 1)
                                    ),
                                  textAlign: TextAlign.left,
                                  )
                              )
                            ],
                          ),
                        )
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[ 
                              Container(
                                margin: const EdgeInsets.only(top: 18.0, bottom: 10.0),
                                child: Center(
                                  child: Text('tes', 
                                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
                                  ),
                                ),
                              ),
                              Image.asset('assets/avion.png', width: 40.0,),
                              Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child : Center(
                                      child : Text('test', 
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color.fromRGBO(59, 59, 61, 1)
                                        ),
                                      textAlign: TextAlign.center,
                                      )
                                    )
                                  )

                            ],
                          )
                          
                        ),
                        Expanded(
                          child: Container(
                            // margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            width: 100.0,
                            height: 120.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.centerRight,
                                  child : Container(
                                    margin: const EdgeInsets.only(right: 15.0),
                                    child : Text("now",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color.fromRGBO(59, 59, 61, 1)
                                        ),
                                      textAlign: TextAlign.right,
                                    )
                                  )
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child : Container(
                                    margin: const EdgeInsets.only(right: 15.0, top: 5.0, bottom: 5.0),
                                    child : Text('aaa',
                                      style: TextStyle(
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(186, 36, 54, 1)
                                        ),
                                      textAlign: TextAlign.right,
                                    )
                                  )
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child : Container(
                                    margin: const EdgeInsets.only(right: 15.0),
                                    child : Text('aaa', 
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color.fromRGBO(59, 59, 61, 1)
                                        ),
                                      textAlign: TextAlign.right,
                                      )
                                  )
                                )
                              ],
                            ),
                          )
                        )
                      ],
                    ),
                  ),
      ]
    )
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