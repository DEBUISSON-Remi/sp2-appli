import 'package:flutter/material.dart';
import 'package:sp1_appli/fees/views/history.dart';
import 'package:sp1_appli/fees/widgets/drawer_7Check.dart';

class HistoryMenu extends StatefulWidget {
  @override
  _HistoryMenuState createState() => _HistoryMenuState();
}

class _HistoryMenuState extends State<HistoryMenu> {
  int _pageIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    History(type: 0),
    History(type: 1),
    History(type: 2),
  ];

  void _onPageTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.done), title: Text("Accepté")),
          BottomNavigationBarItem(
              icon: Icon(Icons.alarm), title: Text("En attente")),
          BottomNavigationBarItem(
              icon: Icon(Icons.block), title: Text("Refusé"))
        ],
        currentIndex: _pageIndex,
        onTap: _onPageTapped,
      ),
      appBar: AppBar(
        title: Text("Historique"),
      ),
      drawer: DrawerSafi(),
      body: Center(
        child: _widgetOptions.elementAt(_pageIndex),
      ),
    );
  }
}
