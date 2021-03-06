import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:memorylife/ui/home_page.dart';
import 'package:memorylife/ui/login/login.dart';
import 'package:memorylife/ui/splash.dart';
import 'package:memorylife/ui/test.dart';

import 'app_config.dart';
import 'router.dart' as Router;

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    AppConfig(
      appName: "Memory Life",
      debugTag: false,
      flavorName: "prod",
      initialRoute: Router.BaseRouter.SPLASH,
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    getKeyHash();
    final config = AppConfig.of(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: config.debugTag,
      theme: ThemeData(
        brightness: Brightness.light,

//          fontFamily: 'Poppins',
      ),
      onGenerateRoute: Router.BaseRouter.generateRoute,
      routes: Router.BaseRouter.routes(context),
      home: Login(),
    );
  }

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
