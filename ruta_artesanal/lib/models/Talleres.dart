
import 'package:meta/meta.dart';
import 'dart:convert';
class Talleres {
    Talleres({
        @required this.idartesano=0,
        @required this.nombrecompleto='',
        @required this.nombreasociacion='',
        @required this.statu='',
        @required this.nombretaller='',
        @required this.telefonocontacto='',
        @required this.emailcontacto='',
        @required this.redessociales='',
        @required this.municipio='',
        @required this.colonia='',
        @required this.cruzamientos='',
        @required this.numero='',
        @required this.latitud='',
        @required this.longitud='',
        @required this.tipotaller=0,
    });

    final int idartesano;
    final String nombrecompleto;
    final String nombreasociacion;
    final String statu;
    final String nombretaller;
    final String telefonocontacto;
    final String emailcontacto;
    final String redessociales;
    final String municipio;
    final String colonia;
    final String cruzamientos;
    final String numero;
    final String latitud;
    final String longitud;
    final int tipotaller;

    factory Talleres.fromJson(Map<String, dynamic> json) => Talleres(
        idartesano: json["idartesano"],
        nombrecompleto: json["nombrecompleto"],
        nombreasociacion: json["nombreasociacion"],
        statu: json["statu"],
        nombretaller: json["nombretaller"],
        telefonocontacto: json["telefonocontacto"],
        emailcontacto: json["emailcontacto"],
        redessociales: json["redessociales"],
        municipio: json["municipio"],
        colonia: json["colonia"],
        cruzamientos: json["cruzamientos"],
        numero: json["numero"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        tipotaller: json["tipotaller"],
    );

    Map<String, dynamic> toJson() => {
        "idartesano": idartesano,
        "nombrecompleto": nombrecompleto,
        "nombreasociacion": nombreasociacion,
        "statu": statu,
        "nombretaller": nombretaller,
        "telefonocontacto": telefonocontacto,
        "emailcontacto": emailcontacto,
        "redessociales": redessociales,
        "municipio": municipio,
        "colonia": colonia,
        "cruzamientos": cruzamientos,
        "numero": numero,
        "latitud": latitud,
        "longitud": longitud,
        "tipotaller": tipotaller,
    };
}
