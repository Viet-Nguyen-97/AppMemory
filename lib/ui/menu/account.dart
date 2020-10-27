import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memorylife/models/User.dart';
import 'package:memorylife/ui/drawer/app_drawer.dart';

import 'package:memorylife/router.dart';
import 'package:memorylife/ui/view_image.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:memorylife/models/services/user.sevice.dart';

class Account extends StatefulWidget {
  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<Account> {

  String cover_image = "assets/loading.png";
  String avatar_image = "assets/loading.png";
  String nickname = "Loading";
  String intro = "Loading";

  User currentUser;
  getInfoUser(){
    userAPIServices.fetchUsers().then((response){
      Iterable list = json.decode(response.body);
      List<User> userList = List<User>();
      userList = list.map((model) => User.fromObject(model)).toList();
      currentUser = userList[0];

      setState(() {
        cover_image = currentUser.background_image;
        avatar_image = currentUser.avatar_image;
        nickname = currentUser.nickname;
        intro = currentUser.intro;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getInfoUser();
  }

  @override
  Widget build(BuildContext context) {
    getInfoUser();
    return Scaffold(
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      overflow: Overflow.visible,
                      children: [
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => ViewImage(image: cover_image,)));
                              },
                              child: Image.asset(cover_image, height: 200, fit: BoxFit.fitWidth,),
                            )
                        ),

                        Positioned(
                            bottom: 10,
                            right: 10,
                            child: GestureDetector(
                              child: Image.asset("assets/pencil-square.png", height: 15,color: Colors.black,),
                            )
                        ),

                        Positioned(
                            top: 150,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => ViewImage(image: avatar_image,)));
                              },
                              child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: ExactAssetImage(avatar_image)
                                      )
                                  )

                              ),
                            )
                        ),

                        Positioned(
                            bottom: -50,
                            child: GestureDetector(
                              child: Image.asset("assets/pencil-square.png", height: 15,color: Colors.black),
                            )
                        ),
                      ],
                    )
                ),
                Container(
                  margin: EdgeInsets.only(top: 70),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text(nickname, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height: 15,),
                      Text(intro, style: TextStyle(fontSize: 16),),
                      SizedBox(height: 15,),
                      _createDrawerItem(icon: AssetImage("assets/user.png"), text: 'Hồ sơ cá nhân',
                          onTap: () => Navigator.pushNamed(context, BaseRouter.PROFILE_USER)),
                      _createDrawerItem(icon: AssetImage("assets/change_pin.png"), text: 'Thay đổi mã PIN',
                          onTap: () => Navigator.pushNamed(context, BaseRouter.CHANGE_PIN)),
                      _createDrawerItem(icon: AssetImage("assets/theme.png"), text: 'Thay đổi chủ đề',),
                      _createDrawerItem(icon: AssetImage("assets/help.png"), text: 'Hỗ trợ',),
                      _createDrawerItem(icon: AssetImage("assets/policy.png"), text: 'Chính sách',),
                      _createDrawerItem(icon: AssetImage("assets/translate.png"), text: 'Ngôn ngữ',),

                      MaterialButton(
                        minWidth: 80.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.red,
                        onPressed: () {
                          //AppNavigator.navigateNavigation();
                          getInfoUser();
                        },
                        child: Text('Đăng xuất', style: TextStyle(fontSize: 16, ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  Widget _createDrawerItem(
      {AssetImage icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          ImageIcon(icon, color: Colors.blue,),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(text, style: TextStyle(fontSize: 16,color: Colors.black),),
          )
        ],
      ),
      onTap: onTap,
      dense: true,
    );
  }
}