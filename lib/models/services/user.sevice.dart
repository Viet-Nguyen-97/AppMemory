import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:memorylife/models/User.dart';


class userAPIServices {
  static String userUrl = 'https://8dd424766343.ngrok.io/api/user/';

  static Future fetchUsers() async {
    return await http.get(userUrl);
  }

  static Future fetchUser(int id) async {
    return await http.get(userUrl+id.toString());
  }

  static Map<String, String> header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  static Future<bool> postUser(User user) async {
    var myUser = user.toMap();
    var userBody = json.encode(myUser);
    var res = await http.post(userUrl, headers: header, body: userBody);
    return Future.value(res.statusCode == 200 ? true : false);
  }

  static Future<bool> deleteUser(int id) async{
    var res = await http.delete(userUrl+id.toString(), headers: header);
    return Future.value(res.statusCode == 200 ? true : false);
  }
}
