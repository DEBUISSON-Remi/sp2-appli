import 'package:flutter/material.dart';
import 'package:sp1_appli/fees/views/history_menu.dart';
import 'package:sp1_appli/fees/views/profile.dart';
import 'package:sp1_appli/fees/views/login_page.dart';
import 'package:sp1_appli/fees/views/retraitVehiculeScreen.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '7Check',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => RetraitVehiculeScreen(),
        '/history': (context) => HistoryMenu(),
        '/profile': (context) => Profile(),
      },
      //home: Login(title: 'SafiFees - Connexion'),
    );
  }
}