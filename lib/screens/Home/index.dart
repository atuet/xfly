import "package:flutter/material.dart";
import "accueil.dart";
import "messagerie.dart";
import "vols.dart";

class HomeScreen extends StatefulWidget {
const HomeScreen({ Key key }) : super(key: key);

@override
HomeScreenState createState() => new HomeScreenState();
}


class HomeScreenState extends State<HomeScreen>{
  int _currentIndex = 0; // this will be set when a new tab is tapped
  final List<Widget> _children = [
    AccueilWidget(),
    VolsWidget(),
    MessagerieWidget()
  ];
  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
          title: Text('X-FLY'),
          backgroundColor: Color.fromRGBO(186, 36, 54, 1),
        ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Accueil'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.airplanemode_active),
            title: new Text('Vols'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messagerie')
          )
        ],
      ),
    );
  }
}