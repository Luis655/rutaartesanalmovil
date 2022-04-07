import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:ruta_artesanal/screens/ArtesaniasScreen.dart';
import 'package:ruta_artesanal/screens/RestaurantesScreen.dart';
import 'package:ruta_artesanal/models/RutasArtesanales.dart';
import 'package:ruta_artesanal/providers/restaurantes_rutas_providers.dart';
import 'package:ruta_artesanal/screens/Login.dart';
import 'package:ruta_artesanal/screens/RutasRestaurantesScreen.dart';
import 'package:ruta_artesanal/screens/RutasTalleresScreen.dart';
import 'package:ruta_artesanal/screens/Rutaspublicas.dart';
import 'package:ruta_artesanal/screens/pruebatalleres.dart';
import 'package:ruta_artesanal/widgets/googlemaps.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import '../providers/rutas_talleres_providers.dart';

String rutaTalleresoRest = 'restaurantes';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigation.selindex=0;

    width = MediaQuery.of(context).size.shortestSide;
    height = MediaQuery.of(context).size.longestSide;
    double h = 50;
    double w = 50;
    
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: appTheme.primaryColor,
              ),
              child: Text(
                'RUTA ARTESANALES',
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
              title: Text('Iniciar Sesion'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Rutaspruebas()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuracion'),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: /*NavigationTest()*/Navigation(),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        hoverElevation: 0,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Mas opciones de Rutas"),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            onPrimary: Colors.white,
                          ),
                          child: Text("nueva ruta"),
                          onPressed: () async {
                            const url =
                                'mailto:hasanmahani08@gmail.com?subject=I am using your flutter project so';
                            // const url = 'https://mail.google.com/mail/u/0/?view=cm&fs=1&tf=1&to=hasanmahani08@gmail.com&su=I+am+using+MIN+pa08+so&ui=2&tf=1';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        height: h,
                        width: w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            onPrimary: Colors.white,
                          ),
                          child: Image.asset('assets/images/instagram.png'),
                          onPressed: () async {
                            const url = 'https://www.instagram.com/hasanm108/';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        height: h,
                        width: w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            onPrimary: Colors.white,
                          ),
                          child: Image.asset('assets/images/telegram.png'),
                          onPressed: () async {
                            const url = 'https://t.me/hasanm08';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        height: h,
                        width: w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            onPrimary: Colors.white,
                          ),
                          child: Image.asset('assets/images/whatsapp.png'),
                          onPressed: () async {
                            const url = 'https://wa.me/+989910187797';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add_location_rounded),
        backgroundColor: appTheme.primaryColor.withOpacity(.5),
      ),

      //body: SingleChildScrollView(
      //scrollDirection: Axis.vertical,
      body: SingleChildScrollView(
        //height: max(10, 1000),
        //width: max(10, 1000),

        //child: Padding(
        //padding: const EdgeInsets.all(0.02),
        child: Center(
          child: Column(
            children: <Widget>[
              HomeTop(),

              //homeDown1,

              //homeDown2,

              googlemaps()
            ],
            //),
          ),
        ),
      ),
    );
  }
}

var selectedloc = 0;
List<String> locs = [
  'Elige',
  'Rutas',
  
];

class HomeTop extends StatefulWidget {
  @override
  _HomeTop createState() => _HomeTop();
}

class _HomeTop extends State<HomeTop> {
  var isFlightselected = true;
  TextEditingController c = TextEditingController(text: locs[1]);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: Clipper08(),
          child: Container(
            height: height! * .35 < 130 ? height! * .35 : 150, //400
            //color: Colors.tealAccent,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              appTheme.primaryColor,
              appTheme.secondaryHeaderColor
            ])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height! / 20,
                ),
                Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.format_align_justify,
                        color: Colors.white,
                      ),

                      /* Icon(
                        Icons.format_align_justify,
                        color: Colors.white,
                      ),*/

                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: width! * 0.002,
                      ),
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedloc = int.parse(index.toString());
                          });
                          if (index == 1 &&
                              rutaTalleresoRest == 'talleres') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RutasTalleresScreen()));
                          } else if (index == 1 &&
                              rutaTalleresoRest == 'restaurantes') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RutasRestaurantesScreen()));
                          }
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              locs[selectedloc],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                        itemBuilder: (BuildContext context) {
                          return <PopupMenuItem<int>>[
                            PopupMenuItem(
                              child: Text(
                                locs[0],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                              value: 0,
                            ),
                            PopupMenuItem(
                              child: Text(
                                locs[1],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                              value: 1,
                            
                            
                            ),
                          ];
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height! / 50,
                ),
                SizedBox(
                  height: height! * 0.001,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Choice08(
                          icon: Icons.handyman_outlined,
                          text: "Rutas Artesanales",
                          selected: isFlightselected),
                      onTap: () {
                        rutaTalleresoRest = 'talleres';
                        setState(() {
                          isFlightselected = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: width! * 0.001,
                    ),
                    InkWell(
                      child: Choice08(
                        icon: Icons.restaurant,
                        text: "Rutas Gastronomicas",
                        selected: !isFlightselected,
                      ),
                      onTap: () {
                        rutaTalleresoRest = 'restaurantes';
                        setState(() {
                          isFlightselected = false;
                        });
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class googlemaps extends StatefulWidget {
  //const googlemaps({Key? key}) : super(key: key);

  @override
  _googlemaps createState() => _googlemaps();
}

class _googlemaps extends State<googlemaps> {
  final _initialCameraPosition = CameraPosition(
    target: LatLng(20.968988833795017, -89.63176712223922),
    zoom: 12,
  );
  @override
  Widget build(BuildContext context) {
    int? id;
    const LatLng _center = const LatLng(33.738045, 73.084488);

    if (rutaTalleresoRest == 'talleres') {
      final rutasartesanalesprovider =
          Provider.of<RutasTalleresProvider>(context);
      final rutasartesanales = rutasartesanalesprovider.displayRutasTalleres;

      final Map<String, Marker> _markers = {};
      final Set<Polyline> _polylines = {};
      LatLng _lastMapPosition = _center;
      setState(() {
        _markers.clear();
        for (var rutasartesanales in rutasartesanales) {
          final marker = Marker(
              markerId: MarkerId(rutasartesanales.nombretaller),
              position: LatLng(double.parse(rutasartesanales.latitud),
                  double.parse(rutasartesanales.longitud)),
              infoWindow: InfoWindow(
                title: rutasartesanales.nombretaller,
                snippet: rutasartesanales.municipio,
              ));

          _markers[rutasartesanales.nombretaller] = marker;
        }
      });
      setState(() {
        _polylines.clear();
        for (var rutasartesanales in rutasartesanales) {
          final _polyline = Polyline(
            polylineId: PolylineId(rutasartesanales.nombretaller),
            visible: true,
            width: 100,
            points: [
              LatLng(double.parse(rutasartesanales.latitud),
                  double.parse(rutasartesanales.longitud))
            ],
            color: Colors.blue,
          );
        }
      });

      return Stack(
        children: <Widget>[
          SizedBox(
              height: max(10, 637),
              width: max(10, 1000),
              child: GoogleMap(
                initialCameraPosition: _initialCameraPosition,
                onMapCreated: (GoogleMapController controller) {},
                myLocationButtonEnabled: true,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                onTap: (position) {
                  print(position);
                },
                markers: _markers.values.toSet(),
                polylines: _polylines.toSet(),
                compassEnabled: false,
              )),
        ],
      );
    } else if (rutaTalleresoRest == 'restaurantes') {
      final rutasartesanalesprovider =
          Provider.of<RestaurantesRutasProvider>(context);
      final rutasartesanales =
          rutasartesanalesprovider.displayRestaurantesRutas;

      final Map<String, Marker> _markers = {};
      final Set<Polyline> _polylines = {};
      LatLng _lastMapPosition = _center;
      setState(() {
        _markers.clear();
        for (var rutasartesanales in rutasartesanales) {
          final marker = Marker(
              markerId: MarkerId(
                  rutasartesanales.rutarestaurantesintermedia.toString()),
              position: LatLng(double.parse(rutasartesanales.latitud),
                  double.parse(rutasartesanales.longitud)),
              infoWindow: InfoWindow(
                title: rutasartesanales.nombreruta,
                snippet: rutasartesanales.municipio,
              ));

          _markers[rutasartesanales.rutarestaurantesintermedia.toString()] =
              marker;
        }
      });
      setState(() {
        _polylines.clear();
        for (var rutasartesanales in rutasartesanales) {
          final _polyline = Polyline(
            polylineId: PolylineId(rutasartesanales.latitud),
            visible: true,
            width: 100,
            points: [
              LatLng(double.parse(rutasartesanales.latitud),
                  double.parse(rutasartesanales.longitud))
            ],
            color: Colors.blue,
          );
        }
      });

      return Stack(
        children: <Widget>[
          SizedBox(
              height: max(10, 637),
              width: max(10, 1000),
              child: GoogleMap(
                initialCameraPosition: _initialCameraPosition,
                onMapCreated: (GoogleMapController controller) {},
                myLocationButtonEnabled: true,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                onTap: (position) {
                  print(position);
                },
                markers: _markers.values.toSet(),
                polylines: _polylines.toSet(),
                compassEnabled: false,
              )),
        ],
      );
    } else {
      final rutasartesanalesprovider =
          Provider.of<RestaurantesRutasProvider>(context);
      final rutasartesanales =
          rutasartesanalesprovider.displayRestaurantesRutas;

      final Map<String, Marker> _markers = {};
      final Set<Polyline> _polylines = {};
      LatLng _lastMapPosition = _center;
      setState(() {
        _markers.clear();
        for (var rutasartesanales in rutasartesanales) {
          final marker = Marker(
              markerId: MarkerId(rutasartesanales.nombreruta),
              position: LatLng(double.parse(rutasartesanales.latitud),
                  double.parse(rutasartesanales.longitud)),
              infoWindow: InfoWindow(
                title: rutasartesanales.municipio,
                snippet: rutasartesanales.municipio,
              ));

          _markers[rutasartesanales.nombreruta] = marker;
        }
      });
      setState(() {
        _polylines.clear();
        for (var rutasartesanales in rutasartesanales) {
          final _polyline = Polyline(
            polylineId: PolylineId(rutasartesanales.nombreruta),
            visible: true,
            width: 100,
            points: [
              LatLng(double.parse(rutasartesanales.latitud),
                  double.parse(rutasartesanales.longitud))
            ],
            color: Colors.blue,
          );
        }
      });

      return Stack(
        children: <Widget>[
          SizedBox(
              height: max(10, 637),
              width: max(10, 1000),
              child: GoogleMap(
                initialCameraPosition: _initialCameraPosition,
                onMapCreated: (GoogleMapController controller) {},
                myLocationButtonEnabled: true,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                onTap: (position) {
                  print(position);
                },
                markers: _markers.values.toSet(),
                polylines: _polylines.toSet(),
                compassEnabled: false,
              )),
        ],
      );
    }
  }
}

class Clipper08 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);
    // ignore: non_constant_identifier_names
    var End = Offset(size.width / 2, size.height - 0.0);
    // ignore: non_constant_identifier_names
    var Control = Offset(size.width / 4, size.height - 0.0);

    path.quadraticBezierTo(Control.dx, Control.dy, End.dx, End.dy);
    // ignore: non_constant_identifier_names
    var End2 = Offset(size.width, size.height - 0.0);
    // ignore: non_constant_identifier_names
    var Control2 = Offset(size.width * .75, size.height - 0.0);

    path.quadraticBezierTo(Control2.dx, Control2.dy, End2.dx, End2.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class Choice08 extends StatefulWidget {
  final IconData? icon;
  final String? text;
  final bool? selected;
  Choice08({this.icon, this.text, this.selected});
  @override
  _Choice08State createState() => _Choice08State();
}

class _Choice08State extends State<Choice08>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: widget.selected!
          ? BoxDecoration(
              color: Colors.white.withOpacity(.20),
              borderRadius: BorderRadius.all(Radius.circular(44)),
            )
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: width! * 0.025,
          ),
          Text(
            widget.text!,
            style: TextStyle(color: Colors.white, fontSize: 13),
          )
        ],
      ),
    );
  }
}

var viewallstyle =
    TextStyle(fontSize: 14, color: appTheme.primaryColor //Colors.teal
        );

//final _initialCameraPosition = CameraPosition(target: LatLng(0, 0));

/*
final _initialCameraPosition = CameraPosition(
  target: LatLng(20.96674753811631, -89.6045995328151),
  zoom: 16,
);

var homeDownmap = Container(
  //margin: const EdgeInsets.all(10.0),
  //color: Colors.amber[600],

  child: Column(
    children: <Widget>[
      SizedBox(
        height: 600,
        width: 900,
        child: GoogleMap(
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (GoogleMapController controller) {},
          myLocationButtonEnabled: false,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: false,
          onTap: (position) {
            print(position);
          },
          compassEnabled: false,
        ),
      ),
    ],
    
  ),
  
  

);*/

var homeDown1 = Container(
  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  margin: const EdgeInsets.all(0.0),
  color: appTheme.primaryColor,
  width: 800.0,
  height: 50.0,
  child: Text(
    'Busca una direcciones',
    style: TextStyle(
      fontSize: 17.0,
      color: Colors.black12,
    ),
    textAlign: TextAlign.center,
  ),
);
var homeDown2 = Container(
  margin: const EdgeInsets.all(0.0),
  color: appTheme.primaryColor,
  width: 800.0,
  height: 40.0,
  child: Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    child: Material(
      elevation: 1.0,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: TextField(
        style: TextStyle(
          fontSize: 10.0,
          color: Colors.black,
        ),
        cursorColor: appTheme.primaryColor,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
            suffixIcon: Material(
              child: InkWell(
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(40)),
            )),
      ),
    ),
  ),
);
