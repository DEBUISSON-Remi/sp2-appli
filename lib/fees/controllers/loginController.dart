import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

oldloginController(
    {String user, String password, bool rememberUserLogin}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  SimpleDialog(
    title: Text("OK"),
  );

  //prefs.setBool('rememberUserLogin', rememberUserLogin);

  return true;
}
