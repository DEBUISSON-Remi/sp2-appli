import 'package:flutter/material.dart';
import 'package:sp1_appli/fees/models/employee.dart';
import 'package:sp1_appli/fees/services/fetch_profile.dart';
import 'package:sp1_appli/fees/widgets/drawer_7Check.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<Employee> futureEmployee;

  @override
  void initState() {
    super.initState();
    futureEmployee = fetchProfile();
  }

  //TODO: Get user specifies and insert into
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profil"),
        ),
        drawer: DrawerSafi(),
        body: SingleChildScrollView(
            child: FutureBuilder<Employee>(
          future: futureEmployee,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller:
                          TextEditingController(text: snapshot.data.lastname),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Nom"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller:
                          TextEditingController(text: snapshot.data.firstname),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Prénom"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller:
                          TextEditingController(text: snapshot.data.login),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Login"),
                    ),
                  ),
                  //TODO: Old password to confirm change
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Mot de passe"),
                    ),
                  ),
                  Divider(),
                  Text("DR"),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Région"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Nom"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Prénom"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "E-mail"),
                    ),
                  ),
                  Divider(),
                  Text("RS"),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Région"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Nom"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Prénom"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "E-mail"),
                    ),
                  ),
                  //TODO: Add profile picture: https://medium.com/fabcoding/adding-an-image-picker-in-a-flutter-app-pick-images-using-camera-and-gallery-photos-7f016365d856
                  //TODO: Last connection hour
                  //TODO: Average time on app

                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () {
                          //TODO: Go to main page
                        },
                        child: Text(
                          "Modifier mon profil",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                        height: 50.0,
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(50.0)),
                      ))
                ],
              );
            } else {
              return Text("An error has occured: ${snapshot.error}");
            }
          },
        )));
  }
}
