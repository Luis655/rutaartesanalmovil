import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;
import 'package:ruta_artesanal/models/RestaurantesRutas.dart';
import 'package:ruta_artesanal/models/RutasArtesanales.dart';
import 'package:ruta_artesanal/providers/rutas_artesanales_providers.dart';
import 'package:ruta_artesanal/screens/HomeScreen.dart';
import 'package:ruta_artesanal/screens/RutasTalleresScreen.dart';
import '../models/RutasTalleres.dart';

class RestaurantesRutasProvider extends ChangeNotifier {
  final int? id;

  String _host = 'www.rutasartesanales.somee.com';

  List<RestaurantesRutas> displayRestaurantesRutas = [];
  RestaurantesRutasProvider({this.id = 0}) {
    getRestaurantesRutas(id);
  }

  getRestaurantesRutas(id) async {
    final Map<String, dynamic> _parameters = {'': ''};
    final url = Uri.http('www.rutasartesanales.somee.com',
        '/api/RutasRestaurantes/${id}');
    final client = RetryClient(http.Client());
    try {
      var response = await client.read(url);
      displayRestaurantesRutas = List<RestaurantesRutas>.from(
          json.decode(response).map((x) => RestaurantesRutas.fromJson(x)));
      notifyListeners();
    } finally {
      client.close();
    }
  }
}
