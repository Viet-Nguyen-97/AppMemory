import 'package:geolocator/geolocator.dart';

class LocationAPIServices {

  static Future getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }



}