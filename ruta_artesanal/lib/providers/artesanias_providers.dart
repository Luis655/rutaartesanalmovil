import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;
import 'package:ruta_artesanal/models/Artesanias.dart';
class ArtesaniasProviders extends ChangeNotifier {

  final String _host = 'www.rutasartesanales.somee.com';

  final Map<String, dynamic> _parameters = {'': ''};

  List<Artesanias> displayArtesanias = [];
  
  ArtesaniasProviders() {
    getArtesanias();
  }

  getArtesanias() async {
    const String endPoint = '/api/Artesania';
    final url = Uri.http(_host, endPoint, _parameters);
    final client = RetryClient(http.Client());

    try {
      var response = await client.read(url);
      displayArtesanias = List<Artesanias>.from(json.decode(response).map((x) => Artesanias.fromJson(x)));
      notifyListeners();
      
    } finally {
      client.close();
    }
  }
}