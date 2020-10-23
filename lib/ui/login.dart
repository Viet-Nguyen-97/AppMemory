import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            top: 300,
            child: Column(
              children: <Widget>[
                Image.asset("assets/logo1.png"),
                SizedBox(height: 40,),
                SignInButton(
                  Buttons.Google,
                  text: "Đăng nhập bằng Google",
                  onPressed: () {},
                )
              ],
            )
          )
        ],
      ),
    );
  }
}