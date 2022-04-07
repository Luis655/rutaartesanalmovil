import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../providers/artesanias_providers.dart';

class ArtesaniasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final artesaniasprovider = Provider.of<ArtesaniasProviders>(context);
    final artesanias = artesaniasprovider.displayArtesanias;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Artesanias',
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
                'Artesanias',
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
            artesanias[index].nombreartesania,
            style: const TextStyle(fontSize: 18.9, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(artesanias[index].descripcionmat +
              ' Hecho de ' +
              artesanias[index].nombrematerial),
          trailing: Icon(Icons.keyboard_arrow_right),
          isThreeLine: false,
          dense: false,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          enabled: true,
          onTap: () {
            selected:
            index.isEven ? true : false;
            int id = artesanias[index].idartesania.toInt();

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
        itemCount: artesanias.length,
      ),
    );

    /* Scaffold(
      body: Center(child: Text("Artesanias")),
    );*/
  }
}
