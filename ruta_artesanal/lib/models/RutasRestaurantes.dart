import 'package:meta/meta.dart';
import 'dart:convert';

class RutasRestaurantes {
    RutasRestaurantes({
        @required this.idrutasrestaurantes=0,
        @required this.nombreruta='',
        @required this.municipio='',

    });

    final int idrutasrestaurantes;
    final String nombreruta;
    final String municipio;


    factory RutasRestaurantes.fromJson(Map<String, dynamic> json) => RutasRestaurantes(
        idrutasrestaurantes: json["idrutasrestaurantes"],
        nombreruta: json["nombreruta"],
        municipio: json["municipio"]== null ? 'No Asignado' : json["municipio"],

    );

    Map<String, dynamic> toJson() => {
        "idrutasrestaurantes": idrutasrestaurantes,
        "nombreruta": nombreruta,
        "municipio": municipio == null ? 'No Asignado' : municipio,
    };
}