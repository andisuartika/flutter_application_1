import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/login/login_screen.dart';
import 'package:flutter_application_1/UI/main/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => new _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  startLaunching() async {
    final prefs = await SharedPreferences.getInstance();
    bool slogin = prefs.getBool('login') ?? false;
    print(slogin);

    var duration = const Duration(seconds: 1);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return slogin ? new MainScreen() : new LoginScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade800, Colors.blue.shade600])),
        child: Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}