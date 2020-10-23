import 'package:flutter/material.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/intro1");
  }

  static void goToIntro2(BuildContext context) {
    Navigator.pushNamed(context, "/intro2");
  }

  static void goToIntro3(BuildContext context) {
    Navigator.pushNamed(context, "/intro3");
  }

  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }
}