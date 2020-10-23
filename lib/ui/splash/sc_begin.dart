import 'package:flutter/material.dart';
import 'package:memorylife/navigator/navigator.dart';

class BeginScreen extends StatefulWidget {
  @override
  _BeginScreenState createState() => _BeginScreenState();
}

class _BeginScreenState extends State<BeginScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      top: 60.0,
                      child: Text(
                        "Memory Life",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      child: Container(
                        height: 230,
                        child: Image.asset(
                          "assets/man_cho1.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 430.0,
                        left: 20,
                        right: 20,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Nhật kí cá nhân",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Nhật kí của bạn, người đồng hành của bạn",
                              style: TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          ],
                        )),
                    Positioned(
                      bottom: 60,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          textColor: Colors.white,
                          color: Colors.blue,
                          onPressed: () {
                            AppNavigator.navigateTwo();
                          },
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Bắt đầu  ',
                                style: TextStyle(fontSize: 18),
                              ),
                              Container(
                                width: 25,
                                height: 18,
                                child: Image.asset("assets/start_ico.png"),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              )
            );
          },
        ),
      ),
    );
  }
}
