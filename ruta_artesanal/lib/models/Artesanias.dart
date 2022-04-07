import 'package:meta/meta.dart';
import 'dart:convert';

List<Artesanias> artesaniasFromJson(String str) => List<Artesanias>.from(json.decode(str).map((x) => Artesanias.fromJson(x)));

String artesaniasToJson(List<Artesanias> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Artesanias {
    Artesanias({
        @required this.idartesania =0,
        @required this.nombreartesania='',
        @required this.descrartesan='',
        @required this.fotoartesania='',
        @required this.nombrematerial='',
        @required this.descripcionmat='',
    });

    final int idartesania;
    final String nombreartesania;
    final String descrartesan;
    final String fotoartesania;
    final String nombrematerial;
    final String descripcionmat;

    factory Artesanias.fromJson(Map<String, dynamic> json) => Artesanias(
        idartesania: json["idartesania"],
        nombreartesania: json["nombreartesania"],
        descrartesan: json["descrartesan"],
        fotoartesania: json["fotoartesania"],
        nombrematerial: json["nombrematerial"],
        descripcionmat: json["descripcionmat"],
    );

    Map<String, dynamic> toJson() => {
        "idartesania": idartesania,
        "nombreartesania": nombreartesania,
        "descrartesan": descrartesan,
        "fotoartesania": fotoartesania,
        "nombrematerial": nombrematerial,
        "descripcionmat": descripcionmat,
    };
}
