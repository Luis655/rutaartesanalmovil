import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;
import '../models/RutasRestaurantes.dart';

class RutasRestaurantesProvider extends ChangeNotifier {
  final String _host = 'www.rutasartesanales.somee.com';
  final Map<String, dynamic> _parameters = {'': ''};
  List<RutasRestaurantes> displayRutasRestaurantes = [];

  RutasRestaurantesProvider() {
    getRutasRestaurantes();
  }

  getRutasRestaurantes() async {
    const String endPoint = '/api/RutasRestaurantes2';

    final url = Uri.http('www.rutasartesanales.somee.com', '/api/RutasRestaurantes2');
    final client = RetryClient(http.Client());

    try {
      var response = await client.read(url);
      displayRutasRestaurantes = List<RutasRestaurantes>.from(
          json.decode(response).map((x) => RutasRestaurantes.fromJson(x)));
      notifyListeners();
    } finally {
      client.close();
    }
  }
}
