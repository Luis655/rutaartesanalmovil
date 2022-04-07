import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruta_artesanal/models/RutasArtesanales.dart';
import 'package:ruta_artesanal/providers/rutas_artesanales_providers.dart';
import 'package:ruta_artesanal/providers/rutas_talleres_providers.dart';
import '../main.dart' as prefix0;
import '../main.dart';
import 'HomeScreen.dart';

final Color discountBackground = prefix0.appTheme.primaryColor;
final Color flightColor = prefix0.appTheme.primaryColor;
final Color chipBackground =
    prefix0.appTheme.secondaryHeaderColor.withOpacity(.2);
final Color borderColor = prefix0.appTheme.primaryColor.withAlpha(100);

class Rutaspruebas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final rutasartesanalesprovider =
        Provider.of<RutasTalleresProvider>(context);
    final rutasartesanales = rutasartesanalesprovider.displayRutasTalleres;
    return Scaffold(
      
      appBar: AppBar(
        
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Rutas de luis',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
            title: Text(
              rutasartesanales[index].latitud,
              style:
                  const TextStyle(fontSize: 18.9, fontWeight: FontWeight.bold),
            ),
            ),
        separatorBuilder: (_, __) => Divider(),
        itemCount: rutasartesanales.length,
      ),
    );
  }
}