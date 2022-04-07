import 'package:meta/meta.dart';
import 'dart:convert';

//estos son los modelos de las rutas de los Talleres
class RutasArtesanales {
    RutasArtesanales({
        @required this.idrutastalleres =0,
        @required this.nombreruta='gikasd',
        @required this.municipio ='',
       
    });

    final int idrutastalleres;
    final String nombreruta;
    final String municipio;
    

    factory RutasArtesanales.fromJson(Map<String, dynamic> json) => RutasArtesanales(
        idrutastalleres: json["idrutastalleres"],
        nombreruta: json["nombreruta"],
        municipio: json["municipio"],
        
    );

    Map<String, dynamic> toJson() => {
        "idrutastalleres": idrutastalleres,
        "nombreruta": nombreruta,
        "municipio": municipio,
        
    };
}
