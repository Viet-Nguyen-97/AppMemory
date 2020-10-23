import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MapImage extends StatefulWidget {
  @override
  MapImageState createState() => MapImageState();
}

class MapImageState extends State<MapImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text("bản đồ",style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}