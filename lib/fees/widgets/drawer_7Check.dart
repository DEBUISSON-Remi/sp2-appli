import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerSafi extends StatefulWidget {
  @override
  _DrawerSafiState createState() => _DrawerSafiState();
}

class _DrawerSafiState extends State<DrawerSafi> {
  Widget _header() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://cdn.pixabay.com/photo/2015/03/26/10/11/classic-691043_960_720.jpg"))),
      child: Stack(
        children: [
          Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text(
              "7Check",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  Widget _drawerItem({IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _header(),
          _drawerItem(
              icon: Icons.home,
              text: "Accueil",
              onTap: () => Navigator.pushNamed(context, '/dashboard')),
          _drawerItem(
              icon: Icons.calendar_today,
              text: "Historique",
              onTap: () => Navigator.pushNamed(context, '/history')),
          _drawerItem(
              icon: Icons.tag_faces,
              text: "Mon profil",
              onTap: () => Navigator.pushNamed(context, '/profile')),
          Divider(),
          _drawerItem(
            icon: Icons.accessible_forward,
            text: "Se déconnecter",
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool('rememberUserLogin', false);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (_) => false);
            },
          )
        ],
      ),
    );
  }
}
