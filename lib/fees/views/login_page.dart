import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp1_appli/fees/services/fetch_login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerWarning = TextEditingController();

  bool rememberMe = false;
  bool usernameTextfieldEnabled = true;
  bool passwordTextfieldEnabled = true;
  bool loadingState = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;
      });

  void _loadingState(bool newValue) => setState(() {
        loadingState = newValue;
      });

  loginController(
      {String user, String password, bool rememberUserLogin}) async {
    _loadingState(true);
    _controllerWarning.text = "Connexion ...";

    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Save token ?
    prefs.setBool('rememberUserLogin', rememberUserLogin);
    //NO API
    Future<String> futurelogin =
        fetchLogin(_controllerName.text, _controllerPassword.text);
    String token = await futurelogin;
    if (token != null) {
      _controllerWarning.text = "";
      prefs.setString('token', token);
      Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (_) => false);
      _loadingState(false);
    } else {
      _controllerWarning.text = "Utilisateur ou mot de passe incorrect";
      _loadingState(false);
    }
    //NO API:
/*
    Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (_) => false);
    _loadingState(false); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connexion"),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _controllerName,
              enabled: !loadingState,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Login"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _controllerPassword,
              enabled: !loadingState,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Mot de passe"),
              obscureText: true,
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: CheckboxListTile(
                  title: Text("Rester connecté"),
                  value: rememberMe,
                  onChanged: loadingState ? null : _onRememberMeChanged)),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Visibility(
              child: MaterialButton(
                minWidth: double.infinity,
                enableFeedback: loadingState,
                onPressed: () {
                  loginController(
                      user: _controllerName.text,
                      password: _controllerPassword.text,
                      rememberUserLogin: rememberMe);
                },
                child: Text(
                  "Se connecter",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                height: 50.0,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(50.0)),
              ),
              visible: !loadingState,
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Visibility(
                child: CircularProgressIndicator(),
                visible: loadingState,
              )),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(_controllerWarning.text),
          )
        ],
      )),
    );
  }
}
