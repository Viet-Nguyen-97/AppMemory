import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memorylife/navigator/navigator.dart';


class Diary extends StatefulWidget {
  @override
  DiaryState createState() => DiaryState();
}

class DiaryState extends State<Diary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 170,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background_home.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 100.0,
                      left: 20.0,
                      child: Container(
                        height: 44,
                        width: 44,
                        child: CircleAvatar(
                          child: Image.asset("assets/avatar.png"),
                        ),
                      )
                  ),

                  Positioned(
                    top: 100.0,
                    left: 80.0,
                    right: 30.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      textColor: Colors.black,
                      color: Colors.white,
                      onPressed: () {
                        AppNavigator.navigateCreateDiary();
                      },
                      child: Text('Hi! Bạn đang nghĩ gì?', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w400),),
                    ),
                  ),
                ],
              ),
            ),

            new Container(
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 270.0,
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset('assets/cricle.png'),
                            SizedBox(width: 10,),
                            Text("Thứ 5, 03/09/2020 ", style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("09:00",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Hôm nay là một ngày đẹp trời",style: TextStyle(
                                  fontSize: 16,
                                ),
                                ),
                              ),
                            ),

                            Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset('assets/image1.png', height: 130, width: 150,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}