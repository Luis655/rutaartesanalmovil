import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;
import 'package:ruta_artesanal/models/RutasArtesanales.dart';
import 'package:ruta_artesanal/providers/rutas_artesanales_providers.dart';
import 'package:ruta_artesanal/screens/HomeScreen.dart';
import 'package:ruta_artesanal/screens/RutasTalleresScreen.dart';
import '../models/RutasTalleres.dart';

class RutasTalleresProvider extends ChangeNotifier {
  final int? id;

  String _host = 'www.rutasartesanales.somee.com';

  List<RutasTalleres> displayRutasTalleres = [];
  RutasTalleresProvider({this.id = 0}) {
    getRutasTalleres(id);
  }

  getRutasTalleres(id) async {
    final Map<String, dynamic> _parameters = {'': ''};
    //final String ids = id.toString();
    //RutasTalleres2 ruta = RutasTalleres2();
    //final String endPoint = '/api/RutasTalleresIntermedia/' + ids;
    
    final url = Uri.http('www.rutasartesanales.somee.com',
        '/api/RutasTalleresIntermedia/${id}');
    final client = RetryClient(http.Client());
    try {
      var response = await client.read(url);
      displayRutasTalleres = List<RutasTalleres>.from(
          json.decode(response).map((x) => RutasTalleres.fromJson(x)));
      notifyListeners();
    } finally {
      client.close();
    }
  }
}
