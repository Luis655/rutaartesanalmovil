import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruta_artesanal/models/Restaurantes.dart';
import 'package:ruta_artesanal/providers/restaurantes_providers.dart';

import '../main.dart';
import '../main.dart';
import '../providers/artesanias_providers.dart';

class RestaurantesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurantesprovider = Provider.of<RestaurantesProviders>(context);
    final restaurantes = restaurantesprovider.displayRestaurantes;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Restaurantes',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Restaurantes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(
            restaurantes[index].nombrerest,
            style: const TextStyle(fontSize: 18.9, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(restaurantes[index].descripcionmenu +
              ' +52 ' +
              restaurantes[index].telfonocomercio),
          trailing: Icon(Icons.keyboard_arrow_right),
          isThreeLine: false,
          dense: false,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          enabled: true,
          onTap: () {
            selected:
            index.isEven ? true : false;
            int id = restaurantes[index].idrestaurante.toInt();

            print(id.toInt());

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AppState(id: id)));
            //RutasTalleresProvider(id: id);
          },
          selected: index.isEven ? false : false,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'http://pic31.nipic.com/20130710/12018626_110428606000_2.jpg'),
          ),
        ),
        separatorBuilder: (_, __) => Divider(),
        itemCount: restaurantes.length,
      ),
    );

    /* Scaffold(
      body: Center(child: Text("Artesanias")),
    );*/
  }
}
