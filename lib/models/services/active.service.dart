import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:memorylife/models/Active.dart';

class ActiveAPIServices {
  static String ActiveUrl = 'https://b70c596d1858.ngrok.io/api/active/';

  static Future fetchActive() async {
    return await http.get(ActiveUrl);
  }

}
