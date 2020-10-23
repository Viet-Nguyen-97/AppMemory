import 'package:flutter/material.dart';
import 'package:memorylife/navigator/navigator.dart';

class TwoScreen extends StatefulWidget {
  @override
  _TwoScreenState createState() => _TwoScreenState();
}

class _TwoScreenState extends State<TwoScreen> {
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
                        child: Center(
                          child: Text(
                            "Memory Life",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                        )),
                    Positioned(
                        top: 150,
                        child: Center(
                          child: Container(
                            height: 230,
                            child: Image.asset(
                              "assets/man_cho2.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                    Positioned(
                      top: 430.0,
                      left: 20,
                      right: 20,
                      child: Center(
                          child: Column(
                        children: <Widget>[
                          Text(
                            "Người bạn đồng hành",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Nhật ký của bạn, lưu giữ những khoảnh khắc trong cuộc sống, hành trình, tâm sự riêng tư",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                    ),
                    Positioned(
                        bottom: 60,
                        child: Center(
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              textColor: Colors.white,
                              color: Colors.blue,
                              onPressed: () {
                                AppNavigator.navigateThree();
                              },
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Tiếp theo',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 3),
                                    width: 25,
                                    height: 18,
                                    child: Image.asset("assets/start_ico.png"),
                                  )
                                ],
                              )),
                        ))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
