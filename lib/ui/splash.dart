import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memorylife/navigator/navigator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    openLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Image.asset("assets/splash.png",
            fit: BoxFit.fill, width: double.infinity),
      ),
    );
  }

  void openLogin() async {
    //bool isSelectedCountry = prefs.containsKey(AppPreferences.COUNTRY);

    Future.delayed(Duration(seconds: 3), () {
      CircularProgressIndicator();
      AppNavigator.navigateBegin();
    });
  }
}
