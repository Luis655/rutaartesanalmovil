import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruta_artesanal/models/RutasArtesanales.dart';
import 'package:ruta_artesanal/models/RutasTalleres.dart';
import 'package:ruta_artesanal/providers/rutas_artesanales_providers.dart';
import 'package:ruta_artesanal/providers/rutas_talleres_providers.dart';
import 'package:ruta_artesanal/screens/pruebatalleres.dart';
import '../main.dart' as prefix0;
import '../main.dart';
import 'HomeScreen.dart';

final Color discountBackground = prefix0.appTheme.primaryColor;
final Color flightColor = prefix0.appTheme.primaryColor;
final Color chipBackground =
    prefix0.appTheme.secondaryHeaderColor.withOpacity(.2);
final Color borderColor = prefix0.appTheme.primaryColor.withAlpha(100);

class RutasTalleresScreen extends StatelessWidget {
  final String? fromloc;
  final String? toloc;
  int? id;
  RutasTalleresScreen({this.fromloc, this.toloc});

  @override
  Widget build(BuildContext context) {
    final rutasartesanalesprovider =
        Provider.of<RutasArtesanalesProvider>(context);
    final rutasartesanales = rutasartesanalesprovider.displayRutasArtesanales;

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
          'Rutas De los Talleres En Yucatan',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        
      ),
      
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
            title: Text(
              rutasartesanales[index].nombreruta,
              style:
                  const TextStyle(fontSize: 18.9, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(rutasartesanales[index].municipio),
            trailing: Icon(Icons.keyboard_arrow_right),
            isThreeLine: false,
            dense: false,
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            enabled: true,
            onTap: () {
              int id = rutasartesanales[index].idrutastalleres.toInt();
              //RutasTalleres2 ruta = new RutasTalleres2();
              //ruta.idrutataller = id;
              //final ruta = RutasTalleresProvider(id: id);
              //RutasTalleresProvider(id: id);
              print(id.toInt());

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AppState(id: id)));
              //RutasTalleresProvider(id: id);
            },
            selected: index.isEven ? true : false,
            leading: CircleAvatar(
              backgroundImage: NetworkImage('http://pic31.nipic.com/20130710/12018626_110428606000_2.jpg'),
            ),
            ),
        separatorBuilder: (_, __) => Divider(),
        itemCount: rutasartesanales.length,
      ),
    );
  }
}

