import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:memorylife/navigator/navigator.dart';

class ThreeScreen extends StatefulWidget {
  @override
  _ThreeScreenState createState() => _ThreeScreenState();
}

class _ThreeScreenState extends State<ThreeScreen> {
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
                          "assets/man_cho3.png",
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
                              "An toàn và bảo mật",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Nhật ký của bạn thuộc về bạn. Thêm mật khẩu để lưu giữ nhật ký ở chế độ riêng tư",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                    Positioned(
                        bottom: 60,
                        child: Container(
                          height: 35,
                          width: 170,
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              textColor: Colors.white,
                              color: Colors.blue,
                              onPressed: () {
                                AppNavigator.navigateOtp();
                              },
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Tạo mật khẩu',
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
                        )),
                    Positioned(
                      bottom: 20,
                      child: RichText(
                          text: TextSpan(
                              text: 'Bỏ qua',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  AppNavigator.navigateNavigation();
                                })),
                    )
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
