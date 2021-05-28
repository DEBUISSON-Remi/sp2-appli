import 'package:flutter/material.dart';

class History extends StatefulWidget {
  History({Key key, this.type}) : super(key: key);

  final int type;
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<String> itemsAccepted = List<String>.generate(20, (i) => "Fiche n°$i");
  List<String> itemsWaiting = List<String>.generate(10, (i) => "Fiche n°$i");
  List<String> itemsRefused = List<String>.generate(5, (i) => "Fiche n°$i");

  @override
  Widget build(BuildContext context) {
    //TODO: Open fees
    if (widget.type == 1) {
      return Container(
          child: ListView.builder(
              itemCount: itemsAccepted.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text("${itemsAccepted[index]}"));
              }));
    } else if (widget.type == 2) {
      return Container(
          child: ListView.builder(
              itemCount: itemsWaiting.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text("${itemsWaiting[index]}"));
              }));
    } else {
      return Container(
          child: ListView.builder(
              itemCount: itemsRefused.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text("${itemsRefused[index]}"));
              }));
    }
  }
}
