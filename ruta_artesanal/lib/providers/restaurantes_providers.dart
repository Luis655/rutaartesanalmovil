import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;
import 'package:ruta_artesanal/models/Artesanias.dart';
import 'package:ruta_artesanal/models/Restaurantes.dart';

class RestaurantesProviders extends ChangeNotifier {

  final String _host = 'www.rutasartesanales.somee.com';

  final Map<String, dynamic> _parameters = {'': ''};

  List<Restaurantes> displayRestaurantes = [];
  
  RestaurantesProviders() {
    getRestaurantes();
  }

  getRestaurantes() async {
    const String endPoint = '/api/Restaurante';
    final url = Uri.http(_host, endPoint, _parameters);
    final client = RetryClient(http.Client());

    try {
      var response = await client.read(url);
      displayRestaurantes = List<Restaurantes>.from(json.decode(response).map((x) => Restaurantes.fromJson(x)));
      notifyListeners();
      
    } finally {
      client.close();
    }
  }
}