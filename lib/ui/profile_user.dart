import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memorylife/models/User.dart';
import 'package:memorylife/ui/drawer/app_drawer.dart';
import 'package:date_format/date_format.dart';

import 'package:memorylife/router.dart';
import 'package:memorylife/ui/menu/account.dart';
import 'package:memorylife/ui/view_image.dart';
import 'package:memorylife/models/services/user.sevice.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({Key key}) : super(key: key);

  @override
  ProfileUserState createState() => ProfileUserState();
}

class ProfileUserState extends State<ProfileUser> {

  String cover_image = "assets/loading.png";
  String avatar_image = "assets/loading.png";
  String nickname = "Loading";
  String intro = "Loading";

  String phonenumber = "Loading";
  DateTime birthday = new DateTime.now();
  String email = "Loading";
  String gender = "Loading";

  final nicknameController = TextEditingController();
  final introController = TextEditingController();
  final phonenumberController = TextEditingController();
  final birthdayController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();

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
        phonenumber = currentUser.phonenumber;
        birthday = DateTime.parse(currentUser.dob);
        email = currentUser.email;
        gender = currentUser.gender;

        nicknameController.value = TextEditingValue(text: nickname);
        introController.value = TextEditingValue(text: intro);
        phonenumberController.value = TextEditingValue(text: phonenumber);
        birthdayController.value = TextEditingValue(text: formatDate(birthday, [yyyy, '-', mm, '-', dd]));
        emailController.value = TextEditingValue(text: email);
        genderController.value = TextEditingValue(text: gender);
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
                            labelText: "Tên hiển thị",
                            alignLabelWithHint: true,
                          ),
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black
                          ),
                          controller: nicknameController,
                          onChanged:(value) => updateNickname(),
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
                              Icons.info_outline,
                              color: Colors.blue,
                            ),
                            prefixText: ' ',
                            labelText: "Giới thiệu",
                            alignLabelWithHint: true,
                          ),
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black
                          ),
                          controller: introController,
                          onChanged:(value) => updateIntro(),
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
                              Icons.phone,
                              color: Colors.blue,
                            ),
                            prefixText: ' ',
                            labelText: "Số điện thoại",
                            alignLabelWithHint: true,
                          ),
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black
                          ),
                          controller: phonenumberController,
                          onChanged:(value) => updatePhoneNumber(),
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
                              Icons.calendar_today,
                              color: Colors.blue,
                            ),
                            prefixText: ' ',
                            labelText: "Ngày sinh",
                            alignLabelWithHint: true,
                          ),
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black
                          ),
                          controller: birthdayController,
                          onChanged:(value) => updateDob(),
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
                              Icons.alternate_email,
                              color: Colors.blue,
                            ),
                            prefixText: ' ',
                            labelText: "Email",
                            alignLabelWithHint: true,
                          ),
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black
                          ),
                          controller: emailController,
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
                              Icons.wc,
                              color: Colors.blue,
                            ),
                            prefixText: ' ',
                            labelText: "Giới tính",
                            alignLabelWithHint: true,
                          ),
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black
                          ),
                          controller: genderController,
                          onChanged:(value) => updateGender(),
                        ),
                      ),

                      MaterialButton(
                        minWidth: 80.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () {
                          saveInfoUser();

                        },
                        child: Text('Lưu lại', style: TextStyle(fontSize: 16, ),),
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

  void saveInfoUser() async {
    var saveRes = await userAPIServices.postUser(currentUser);
    saveRes == true ?
    _showDialog("assets/done.png") : _showDialog("assets/error.png");
  }

  void _showDialog(String image) {
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
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text('Xác nhận', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                    ),
                  ],
                )
            ),
          );

        });
  }

  void updatePhoneNumber(){
    currentUser.phonenumber = phonenumberController.text;
  }
  void updateDob(){
    currentUser.dob = birthdayController.text;
  }
  void updateEmail(){
    currentUser.email = emailController.text;
  }
  void updateGender(){
    currentUser.gender = genderController.text;
  }
  void updateNickname(){
    currentUser.nickname = nicknameController.text;
  }
  void updateIntro(){
    currentUser.intro = introController.text;
  }
}