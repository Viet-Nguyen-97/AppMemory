import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:memorylife/navigator/navigator.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'dart:async';

class UnlockApp extends StatefulWidget {
  final String pinn;

  UnlockApp({Key key, @required this.pinn}) : super(key: key);

  @override
  _UnlockApp createState() => new _UnlockApp();
}

class _UnlockApp extends State<UnlockApp>{
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.blue),
      borderRadius: BorderRadius.circular(5.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Builder(
          builder: (context) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    top: 50.0,
                    child: Container(

                      height: 100,
                      width: 90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/lock.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                ),

                Positioned(
                    top: 250.0,
                    left: 20,
                    right: 20,
                    child: Center(
                      child: Text("Nhập mật khẩu của bạn", style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    )
                ),

                Positioned(
                    top: 280,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        margin: const EdgeInsets.all(20.0),
                        padding: const EdgeInsets.all(5.0),
                        child: PinPut(
                          fieldsCount: 6,
                          onSubmit: (String pin) => _compare("111222",pin, context),
                          focusNode: _pinPutFocusNode,
                          controller: _pinPutController,
                          submittedFieldDecoration: _pinPutDecoration.copyWith(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          selectedFieldDecoration: _pinPutDecoration,
                          followingFieldDecoration: _pinPutDecoration.copyWith(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    )
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _compare(String s1, String s2, BuildContext context) async {
    if (s1.compareTo(s2) == 0) {
      return showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel: MaterialLocalizations.of(context)
              .modalBarrierDismissLabel,
          barrierColor: Colors.black45,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext buildContext,
              Animation animation,
              Animation secondaryAnimation) {
            return Center(
              child: Container(
                  width: MediaQuery.of(context).size.width - 10,
                  height: MediaQuery.of(context).size.height -  80,
                  padding: EdgeInsets.all(20),

                  alignment: Alignment.center,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/done.png"),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () {
                          AppNavigator.navigateNavigation();
                        },
                        child: Text('Xác nhận', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                      ),
                    ],
                  )
              ),
            );

          });
    }
    else{
      return showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel: MaterialLocalizations.of(context)
              .modalBarrierDismissLabel,
          barrierColor: Colors.black45,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext buildContext,
              Animation animation,
              Animation secondaryAnimation) {
            return Center(
              child: Container(
                  width: MediaQuery.of(context).size.width - 10,
                  height: MediaQuery.of(context).size.height -  80,
                  padding: EdgeInsets.all(20),

                  alignment: Alignment.center,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/error.png"),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () {
                          AppNavigator.navigateBack();
                        },
                        child: Text('Xác nhận', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                      ),
                    ],
                  )
              ),
            );

          });
    }
  }

}