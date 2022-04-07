import 'package:meta/meta.dart';
import 'dart:convert';
//estos son los modelos de los talleres que contienen las rutas.... ejem. ruta 1 ==> {taller1, taller2, taller3}



class RutasTalleres {
    RutasTalleres({
        @required this.idrutatalleresintermedia=0,
        @required this.idrutastalleres =0,
        @required this.idartesano =0,
        @required this.nombretaller='',
        @required this.municipio='',
        @required this.latitud='',
        @required this.longitud='',
    });

    final int idrutatalleresintermedia;
    final int idrutastalleres;
    final int idartesano;
    final String nombretaller;
    final String municipio;
    final String latitud;
    final String longitud;

    factory RutasTalleres.fromJson(Map<String, dynamic> json) => RutasTalleres(
        idrutatalleresintermedia: json["idrutatalleresintermedia"],
        idrutastalleres: json["idrutastalleres"],
        idartesano: json["idartesano"],
        nombretaller: json["nombretaller"],
        municipio: json["municipio"],
        latitud: json["latitud"],
        longitud: json["longitud"],
    );

    Map<String, dynamic> toJson() => {
        "idrutatalleresintermedia": idrutatalleresintermedia,
        "idrutastalleres": idrutastalleres,
        "idartesano": idartesano,
        "nombretaller": nombretaller,
        "municipio": municipio,
        "latitud": latitud,
        "longitud": longitud,
    };
}