import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memorylife/ui/diary/create_diary.dart';
import 'package:memorylife/ui/login/login.dart';
import 'package:memorylife/ui/menu/calendar.dart';
import 'package:memorylife/ui/menu/image_library.dart';
import 'package:memorylife/ui/menu/map.dart';
import 'package:memorylife/ui/pincode/change_pin.dart';
import 'package:memorylife/ui/profile_user.dart';
import 'package:memorylife/ui/splash/sc_begin.dart';
import 'package:memorylife/ui/splash/sc_three_screen.dart';
import 'package:memorylife/ui/splash/sc_two_screen.dart';
import 'package:memorylife/ui/note/create_note.dart';

import 'ui/home_page.dart';
import 'ui/pincode/new_pin.dart';
import 'ui/splash.dart';

class BaseRouter {
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String SPLASH_ONE = '/splash_one';
  static const String SPLASH_TWO = '/splash_two';
  static const String SPLASH_THREE = '/splash_three';
  static const String OTP = '/otp';
  static const String NAVIGATION = '/navigation';
  static const String CREATE_DIARY = '/create_diary';
  static const String CREATE_NOTE = '/create_note';
  static const String CHANGE_PIN = '/change_pin';
  static const String CALENDAR = '/calendar';
  static const String PROFILE_USER = '/profile_user';
  static const String IMAGE_LIBRARY = '/library_image';
  static const String MAP = '/map';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case SPLASH_ONE:
        return MaterialPageRoute(builder: (_) => BeginScreen());
      case SPLASH_TWO:
        return MaterialPageRoute(builder: (_) => TwoScreen());
      case SPLASH_THREE:
        return MaterialPageRoute(builder: (_) => ThreeScreen());
      case NAVIGATION:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }

  static Map<String, WidgetBuilder> routes(BuildContext context) {
    return {
      SPLASH: (context) => SplashScreen(),
      SPLASH_ONE: (context) => BeginScreen(),
      SPLASH_TWO: (context) => TwoScreen(),
      SPLASH_THREE: (context) => ThreeScreen(),
      LOGIN: (context) => Login(),
      OTP: (context) => PinPutTest(),
      NAVIGATION: (context) => MyHomePage(),
      CREATE_DIARY: (context) => CreateNewDiary(),
      CREATE_NOTE: (context) => CreateNewNote(),
      CHANGE_PIN: (context) => ChangePin(),
      CALENDAR: (context) => Calendar(),
      PROFILE_USER: (context) => ProfileUser(),
      IMAGE_LIBRARY: (context) => ImageLibrary(),
      MAP: (context) => MapImage(),
    };
  }
}
