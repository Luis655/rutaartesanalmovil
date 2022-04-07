import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;
import 'package:ruta_artesanal/models/Artesanias.dart';
import 'package:ruta_artesanal/models/Talleres.dart';
class TalleresProviders extends ChangeNotifier {

  final String _host = 'www.rutasartesanales.somee.com';
  final Map<String, dynamic> _parameters = {'': ''};
  List<Talleres> displayTalleres = [];
  TalleresProviders() {
    getTalleres();
  }

  getTalleres() async {
    const String endPoint = '/api/Artesano';
    final url = Uri.http(_host, endPoint, _parameters);
    final client = RetryClient(http.Client());

    try {
      var response = await client.read(url);
      displayTalleres = List<Talleres>.from(json.decode(response).map((x) => Talleres.fromJson(x)));
      notifyListeners();
      
    } finally {
      client.close();
    }
  }
}