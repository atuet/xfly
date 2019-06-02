import "package:flutter/material.dart";
import "accueil.dart";
import "profil.dart";
import "vols.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => new HomeScreenState();
}

// Fichier qui va permettre de gérer les 3 pages de la page
// d'accueil
class HomeScreenState extends State<HomeScreen> {
  // Page 1 = 0, page 2 = 1, page 3 = 2
  int _currentIndex = 0;

  // Définition des 3 widgets pour les 3 parties de la page
  // Les widgets comportent tout le code des 3 parties et sont
  // donc définis dans leurs fichiers respectifs
  final List<Widget> _children = [
    AccueilWidget(),
    VolsWidget(),
    ProfileScreen()
  ];

  // Lorsque l'on tappe sur une page en bas,
  // on actualise l'index
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      // Partie Haute de l'application avec le nom
      appBar: AppBar(
        title: Text('X-FLY'),
        backgroundColor: Color.fromRGBO(186, 36, 54, 1),
      ),

      // Le body de notre application est récupère
      // le widget correspondant a la catégorie actuelle
      // dans la liste _children déclarée ligne 22
      body: _children[_currentIndex],

      // Partie basse de la page avec les 3 boutons
      // pour accéder aux différents widgets
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
              icon: Icon(Icons.portrait), title: Text('Profil'))
        ],
      ),
    );
  }
}
