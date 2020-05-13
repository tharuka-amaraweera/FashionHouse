import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'view/signin.dart';

//HomeSplashScreen page generation was inspired by the youtube tutorial "https://fluttermaster.com/create-splash-screen-in-flutter/"
class HomeSplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomeSplashScreenState();
  }
}

class HomeSplashScreenState extends State<HomeSplashScreen> {

  @override
  void initState() {
    super.initState();
    loadData();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        gradient: LinearGradient(
            colors: [
              Colors.white,
              Color(0xFFA1887F)
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft
        ),
      ),
      child: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0,200.0,20.0,10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/logo.png'),
                radius: 120.0,
              ),
            ),
          ),
          Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
            ),
          ),
        ],
      )
    );
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Signin()));
  }
}