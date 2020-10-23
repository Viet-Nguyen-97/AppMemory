import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memorylife/navigator/navigator.dart';
import 'package:intl/intl.dart';

class DetailDiary extends StatefulWidget {
  DetailDiary({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DetailDiaryState createState() => _DetailDiaryState();
}

class _DetailDiaryState extends State<DetailDiary> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blue),
            onPressed: () => AppNavigator.navigateBack(),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.mode_edit),
              onPressed: (){},
            ),

            new IconButton(
              icon: Icon(Icons.print),
              onPressed: (){},
            ),

            new IconButton(
              icon: Icon(Icons.share),
              onPressed: (){},
            ),

            new IconButton(
              icon: Icon(Icons.star),
              onPressed: (){},
            )
          ],


        ),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Image.asset("assets/splash.png",
                    fit: BoxFit.fill, width: double.infinity),
              ),
            ),


          ],
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
