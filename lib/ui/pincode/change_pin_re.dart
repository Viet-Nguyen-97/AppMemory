import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:memorylife/models/User.dart';
import 'package:memorylife/navigator/navigator.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'dart:async';
import 'package:memorylife/models/services/user.sevice.dart';

class ChangePinRe extends StatefulWidget {
  final String pinn;
  ChangePinRe({Key key, @required this.pinn}) : super(key: key);

  @override
  _ChangePinReState createState() => new _ChangePinReState();
}

class _ChangePinReState extends State<ChangePinRe>{
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.blue),
      borderRadius: BorderRadius.circular(5.0),
    );
  }

  User currentUser;
  getInfoUser(){
    userAPIServices.fetchUsers().then((response){
      Iterable list = json.decode(response.body);
      List<User> userList = List<User>();
      userList = list.map((model) => User.fromObject(model)).toList();
      currentUser = userList[0];
    });
  }

  @override
  void initState() {
    super.initState();
    getInfoUser();
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
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                Positioned(
                    top: 250.0,
                    left: 20,
                    right: 20,
                    child: Center(
                      child: Text("Nhập lại mã pin", style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w700),
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
                          onSubmit: (String pin) => _compare(widget.pinn ,pin, context),
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

  void saveInfoUser() async {
    var saveRes = await userAPIServices.postUser(currentUser);
    saveRes == true ?
    _showDialog("assets/done.png","Thay đổi mã pin thành công") : _showDialog("assets/error.png","Lỗi kết nối. Vui lòng thử lại");
  }

  void _showDialog(String image, String message) {
    showGeneralDialog(
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
                    Image.asset(image),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(message, style: TextStyle(fontSize: 15, color: Colors.green),),
                    ),
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

  Future<void> _compare(String s1, String s2, BuildContext context) async {
    if (s1.compareTo(s2) == 0) {
      currentUser.pincode = s2;
      saveInfoUser();
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
                      Text("Mã pin bạn vừa nhập chưa khớp! Vui lòng nhập lại", style: TextStyle(fontSize: 15),),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () {
                          AppNavigator.navigateBack();
                          _pinPutController.text = '';
                          _pinPutFocusNode.requestFocus();
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


  void goHome() async {
    Future.delayed(Duration(seconds: 3), () {
      AppNavigator.navigateNavigation();
    });
  }
}