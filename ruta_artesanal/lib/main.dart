import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruta_artesanal/models/RutasArtesanales.dart';
import 'package:ruta_artesanal/providers/artesanias_providers.dart';
import 'package:ruta_artesanal/providers/restaurantes_providers.dart';
import 'package:ruta_artesanal/providers/restaurantes_rutas_providers.dart';
import 'package:ruta_artesanal/providers/rutas_artesanales_providers.dart';
import 'package:ruta_artesanal/providers/rutas_restaurantes_providers.dart';
import 'package:ruta_artesanal/providers/rutas_talleres_providers.dart';
import 'package:ruta_artesanal/providers/talleres_providers.dart';
import 'screens/RestaurantesScreen.dart' as prefix0;
import 'package:url_launcher/url_launcher.dart';
import 'screens/ArtesaniasScreen.dart';
import 'screens/TalleresScreen.dart';
import 'screens/HomeScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const AppState(),
    theme: appTheme,
    title: "Rutas Artesanales de Yucatan",
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      super.createHttpClient(context)
        ..badCertificateCallback = (cert, host, port) => true;
}

ThemeData appTheme = ThemeData(
  
    primaryColor: Colors.purple,
    /* Colors.tealAccent,*/
    secondaryHeaderColor: Colors.blue /* Colors.teal*/
    // fontFamily:
    );

int sel = 0;
double? width;
double? height;
final bodies = [
  HomeScreen(),
  TalleresScreen(),
  ArtesaniasScreen(),
  prefix0.RestaurantesScreen(),
  //StackDown()
];

class AppState extends StatelessWidget {
  final int? id;
  const AppState({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(
          create: (context) => RutasRestaurantesProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => RutasTalleresProvider(id: id),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => RutasArtesanalesProvider(),
          lazy: false,
        ),
         ChangeNotifierProvider(
          create: (context) => RestaurantesRutasProvider(id: id),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => ArtesaniasProviders(),
          lazy: false,
        ),
         ChangeNotifierProvider(
          create: (context) => RestaurantesProviders(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => TalleresProviders(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNav(),
      ),
    );
  }
}

class BottomNav extends StatefulWidget {
  BottomNav({Key? key}) : super(key: key);

  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<BottomNavigationBarItem> createItems() {
    List<BottomNavigationBarItem> items = [];
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.add_location_alt,
          color: appTheme.primaryColor,
        ),
        icon: const Icon(
          Icons.add_location_alt,
          color: Colors.black,
        ),
        label: "Rutas"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.add_business_rounded,
          color: appTheme.primaryColor,
        ),
        icon: const Icon(
          Icons.add_business_rounded,
          color: Colors.black,
        ),
        label: "Talleres"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.add_shopping_cart_outlined,
          color: appTheme.primaryColor,
        ),
        icon: const Icon(
          Icons.add_shopping_cart_outlined,
          color: Colors.black,
        ),
        label: "Artesanias"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.restaurant_menu_outlined,
          color: appTheme.primaryColor,
        ),
        icon: const Icon(
          Icons.restaurant_menu_outlined,
          color: Colors.black,
        ),
        label: "Restaurantes"));
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: bodies.elementAt(sel),
      
        bottomNavigationBar: BottomNavigationBar(
          items: createItems(),
          unselectedItemColor: Colors.black,
          selectedItemColor: appTheme.primaryColor,
          type: BottomNavigationBarType.shifting,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          currentIndex: sel,
          elevation: 1.5,
          onTap: (int index) {
            if (index != sel)
              setState(() {
                sel = index;
              });
          },
        ));
  }
}
