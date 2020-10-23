import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memorylife/ui/drawer/app_drawer.dart';

import 'package:memorylife/router.dart';
import 'package:memorylife/ui/view_image.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({Key key}) : super(key: key);

  @override
  ProfileUserState createState() => ProfileUserState();
}

class ProfileUserState extends State<ProfileUser> {

  String cover_image = "assets/cover_image.png";
  String avatar_image = "assets/image1.png";
  String nickname = "Nguyễn Linh An";
  String intro = "Don't let your dreams just be dreams";

  String fullname = "Nguyễn Linh An";
  String birthday = "20/09/1998";
  String email = "linhan98@gmail.com";
  String sex = "Nữ";

  final fullnameController = TextEditingController();
  final birthdayController = TextEditingController();
  final emailController = TextEditingController();
  final sexController = TextEditingController();

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
                      Text(nickname, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height: 15,),
                      Text(intro, style: TextStyle(fontSize: 16),),
                      SizedBox(height: 15,),
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
                            labelText: "Họ và tên",
                            alignLabelWithHint: true,
                          ),
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black
                          ),
                          controller: fullnameController,
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
                          controller: sexController,
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
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                // Retrieve the text the that user has entered by using the
                                // TextEditingController.
                                content: Text(fullnameController.text + "/n" + birthdayController.text + "/n" + emailController.text + "/n" + sexController.text ),
                              );
                            },
                          );
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


}