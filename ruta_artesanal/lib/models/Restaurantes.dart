import 'package:meta/meta.dart';
import 'dart:convert';

List<Restaurantes> restaurantesFromJson(String str) => List<Restaurantes>.from(json.decode(str).map((x) => Restaurantes.fromJson(x)));

String restaurantesToJson(List<Restaurantes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Restaurantes {
    Restaurantes({
        @required this.idrestaurante=0,
        @required this.nombrerest='',
        @required this.telfonocomercio='',
        @required this.descripcionmenu='',
        @required this.latitud='',
        @required this.longitud='',
        @required this.tiporestaurante=0,
        @required this.direccion='',
        @required this.fotorest='',
    });

    final int idrestaurante;
    final String nombrerest;
    final String telfonocomercio;
    final String descripcionmenu;
    final String latitud;
    final String longitud;
    final int tiporestaurante;
    final String direccion;
    final String fotorest;

    factory Restaurantes.fromJson(Map<String, dynamic> json) => Restaurantes(
        idrestaurante: json["idrestaurante"],
        nombrerest: json["nombrerest"],
        telfonocomercio: json["telfonocomercio"],
        descripcionmenu: json["descripcionmenu"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        tiporestaurante: json["tiporestaurante"],
        direccion: json["direccion"],
        fotorest: json["fotorest"],
    );

    Map<String, dynamic> toJson() => {
        "idrestaurante": idrestaurante,
        "nombrerest": nombrerest,
        "telfonocomercio": telfonocomercio,
        "descripcionmenu": descripcionmenu,
        "latitud": latitud,
        "longitud": longitud,
        "tiporestaurante": tiporestaurante,
        "direccion": direccion,
        "fotorest": fotorest,
    };
}
