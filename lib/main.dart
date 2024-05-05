import 'package:flutter/material.dart';
import 'package:projetflutter/AppState.dart';
import 'package:projetflutter/Khadija/home.dart';
import 'package:projetflutter/Saif/home.dart';
import 'package:projetflutter/authentification/login.dart';
import 'package:projetflutter/authentification/register.dart';
import 'package:projetflutter/authentification/welcome.dart';
import 'package:projetflutter/home.dart';
import 'package:projetflutter/map_screen.dart'; // Importez l'écran de la carte
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:projetflutter/provider/theme_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Map<String, Widget Function(BuildContext)> routes = {
    '/home': (context) => HomePage(),
    '/saifhome': (context) => NavigationExample(),
    '/khadijahome': (context) => HomeKhadija(),
    '/inscription': (context) => InscriptionPage(),
    '/authentification': (context) => AuthentificationPage(),
    '/welcome': (context) => WelcomePage(),
    '/map': (context) => MapScreen(), // Ajoutez l'écran de la carte à vos routes
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => AppState()),
      ],
      child: Consumer2<ThemeProvider, AppState>(
        builder: (context, themeProvider, appState, child) {
          return MaterialApp(
            theme: themeProvider.theme,
            debugShowCheckedModeBanner: false,
            initialRoute: '/welcome',
            routes: routes,
          );
        },
      ),
    );
  }
}
