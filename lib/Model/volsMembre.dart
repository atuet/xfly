// To parse this JSON data, do
//
//     final volsmembre = volsmembreFromJson(jsonString);

import 'dart:convert';

Volsmembre volsmembreFromJson(String str) =>
    Volsmembre.fromJson(json.decode(str));

String volsmembreToJson(Volsmembre data) => json.encode(data.toJson());

class Volsmembre {
  List<Vol> vols;

  Volsmembre({
    this.vols,
  });

  factory Volsmembre.fromJson(Map<String, dynamic> json) => new Volsmembre(
        vols: new List<Vol>.from(json["Vols"].map((x) => Vol.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Vols": new List<dynamic>.from(vols.map((x) => x.toJson())),
      };
}

class Vol {
  int idVol;
  String numVol;
  String aeroDepart;
  String aeroArrive;
  String dateDepart;
  String dateArrive;
  String heureDepart;
  String heureArrive;
  String estimation;
  int idAffectation;
  int idMembre;

  Vol({
    this.idVol,
    this.numVol,
    this.aeroDepart,
    this.aeroArrive,
    this.dateDepart,
    this.dateArrive,
    this.heureDepart,
    this.heureArrive,
    this.estimation,
    this.idAffectation,
    this.idMembre,
  });

  factory Vol.fromJson(Map<String, dynamic> json) => new Vol(
        idVol: json["id_vol"],
        numVol: json["num_vol"],
        aeroDepart: json["aero_depart"],
        aeroArrive: json["aero_arrive"],
        dateDepart: json["date_depart"],
        dateArrive: json["date_arrive"],
        heureDepart: json["heure_depart"],
        heureArrive: json["heure_arrive"],
        estimation: json["estimation"],
        idAffectation: json["id_affectation"],
        idMembre: json["id_membre"],
      );

  Map<String, dynamic> toJson() => {
        "id_vol": idVol,
        "num_vol": numVol,
        "aero_depart": aeroDepart,
        "aero_arrive": aeroArrive,
        "date_depart": dateDepart,
        "date_arrive": dateArrive,
        "heure_depart": heureDepart,
        "heure_arrive": heureArrive,
        "estimation": estimation,
        "id_affectation": idAffectation,
        "id_membre": idMembre,
      };
}
