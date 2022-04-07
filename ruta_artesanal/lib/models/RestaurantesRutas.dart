import 'package:meta/meta.dart';
import 'dart:convert';

//List<RestaurantesRutas> restaurantesRutasFromJson(String str) => List<RestaurantesRutas>.from(json.decode(str).map((x) => RestaurantesRutas.fromJson(x)));

//String restaurantesRutasToJson(List<RestaurantesRutas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantesRutas {
    RestaurantesRutas({
        @required this.rutarestaurantesintermedia=0,
        @required this.idrutasrestaurantes=0,
        @required this.idrestaurante=0,
        @required this.nombreruta='',
        @required this.municipio='',
        @required this.latitud='',
        @required this.longitud='',
        @required this.tiporestaurante=0,
    });

    final int rutarestaurantesintermedia;
    final int idrutasrestaurantes;
    final int idrestaurante;
    final String nombreruta;
    final String municipio;
    final String latitud;
    final String longitud;
    final int tiporestaurante;

    factory RestaurantesRutas.fromJson(Map<String, dynamic> json) => RestaurantesRutas(
        rutarestaurantesintermedia: json["rutarestaurantesintermedia"],
        idrutasrestaurantes: json["idrutasrestaurantes"],
        idrestaurante: json["idrestaurante"],
        nombreruta: json["nombreruta"],
        municipio: json["municipio"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        tiporestaurante: json["tiporestaurante"],
    );

    Map<String, dynamic> toJson() => {
        "rutarestaurantesintermedia": rutarestaurantesintermedia,
        "idrutasrestaurantes": idrutasrestaurantes,
        "idrestaurante": idrestaurante,
        "nombreruta": nombreruta,
        "municipio": municipio,
        "latitud": latitud,
        "longitud": longitud,
        "tiporestaurante": tiporestaurante,
    };
}
