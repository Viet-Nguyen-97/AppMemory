import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:memorylife/navigator/navigator.dart';

class Login extends StatelessWidget {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
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
            top: 250,
            left: 20,
            right: 20,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20, top: 10, bottom: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      prefixIcon: new Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      prefixText: ' ',
                      labelText: "Tài khoản",
                      alignLabelWithHint: true,
                    ),
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black
                    ),
                    controller: usernameController,
                    onChanged:(value) => updateUsername(),
                  ),
                ),
                Container(

                  padding: EdgeInsets.only(left: 20,right: 20, top: 10, bottom: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      prefixIcon: new Icon(
                        Icons.lock_outline,
                        color: Colors.blue,
                      ),
                      prefixText: ' ',
                      labelText: "Mật khẩu",
                      alignLabelWithHint: true,
                    ),
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black
                    ),
                    controller: passwordController,
                    onChanged:(value) => updatePassword(),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20, bottom: 10),
                  child: GestureDetector(
                    onTap: (){
                      print("Quên mk");
                    },
                    child: Text("Quên mật khẩu ?", textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.deepOrange, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),),
                  )
                ),
                MaterialButton(
                  minWidth: 70.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    print('$username' + "   " + '$password');
                    AppNavigator.navigateBegin();
                  },
                  child: Text('Đăng nhập', style: TextStyle(fontSize: 15, ),),
                ),

                SizedBox(height: 20,),
                Text("Hoặc"),
                SizedBox(height: 20,),
                SignInButton(
                  Buttons.GoogleDark,
                  text: "Đăng nhập bằng Google",
                  onPressed: () {},
                )
              ],
            )
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Bạn chưa có tài khoản?  ',
                    style: TextStyle(
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: 'Đăng kí',
                          style: TextStyle(
                              color: Colors.blueAccent, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
                            }
                      )
                    ]
                ),
              ),
            )
          )
        ],
      ),
    );
  }

  void updateUsername(){
    username = usernameController.text;
  }
  void updatePassword(){
    password = passwordController.text;
  }
}