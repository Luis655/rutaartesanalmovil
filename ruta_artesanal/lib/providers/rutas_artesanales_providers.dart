import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;
import '../models/RutasArtesanales.dart';

class RutasArtesanalesProvider extends ChangeNotifier {
  final String _host = 'www.rutasartesanales.somee.com';
  final Map<String, dynamic> _parameters = {'': ''};
  List<RutasArtesanales> displayRutasArtesanales = [];
  
  RutasArtesanalesProvider() {
    getRutasArtesanales();
  }

  getRutasArtesanales() async {
    const String endPoint = '/api/RutasTalleres';
    final url = Uri.http(_host, endPoint, _parameters);
    final client = RetryClient(http.Client());

    try {
      var response = await client.read(url);
      displayRutasArtesanales = List<RutasArtesanales>.from(json.decode(response).map((x) => RutasArtesanales.fromJson(x)));
      notifyListeners();
      
    } finally {
      client.close();
    }
  }
}
