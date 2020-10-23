import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memorylife/models/Active.dart';
import 'package:memorylife/models/services/active.service.dart';
import 'package:memorylife/navigator/navigator.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class CreateNewDiary extends StatefulWidget {
  CreateNewDiary({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CreateNewDiaryState createState() => _CreateNewDiaryState();
}

class _CreateNewDiaryState extends State<CreateNewDiary> {
  Icon searchIcon = new Icon(Icons.search);
  String formatter = DateFormat('dd / MM / yyyy').format(DateTime.now());

  final List<String> emotion = <String>['Vui vẻ','Hào hứng','Đáng yêu','Mệt mỏi','Đói','Tức giận',];
  final List<String> emotionImage = <String>['assets/happy.png','assets/smile.png','assets/lovely.png','assets/cold.png','assets/yummy.png','assets/angry.png',];
  var FeelID = 0;

  List<Active> actives;
  getActive(){
    ActiveAPIServices.fetchActive().then((response){
      Iterable list = json.decode(response.body);
      List<Active> activeList = List<Active>();
      activeList = list.map((model) => Active.fromObject(model)).toList();

      setState(() {
        actives = activeList;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getActive();
  }

  @override
  Widget build(BuildContext context) {
    getActive();
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => AppNavigator.navigateBack(),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 20),
            child: MaterialButton(
              minWidth: 70.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {
                //AppNavigator.navigateNavigation();
              },
              child: Text('Lưu', style: TextStyle(fontSize: 15, ),),
            ),
          )
        ],
        title: Text(formatter, style: TextStyle(fontSize: 18, color: Colors.blue),),

      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Bạn đang nghĩ gì?',
                  alignLabelWithHint: true,
                ),
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 12,
              ),
            ),
          ),

          Positioned(
            bottom: 10,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Tooltip(
                    message: "Đính kèm",
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                        child: Image.asset("assets/paperclip.png",scale: 1.5,),
                        padding: EdgeInsets.all(10),
                        shape: CircleBorder(),

                  ),
                  ),
                  MaterialButton(
                    onPressed: () {

                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Image.asset("assets/local.png",scale: 1.5,),
                    padding: EdgeInsets.all(10),
                    shape: CircleBorder(),
                  ),
                  MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                              ),
                              child: Container(
                                  height: 250,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Cảm xúc", style: TextStyle(fontSize: 18),),
                                            SizedBox(height: 30,),
                                            Container(
                                                height: 160,
                                                child: ListView.builder(
                                                    padding: const EdgeInsets.all(8),
                                                    physics: ClampingScrollPhysics(),
                                                    shrinkWrap: true,
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: emotion.length,
                                                    itemBuilder: (BuildContext context, int index) {
                                                      return Container(
                                                        height: 50,
                                                        width: 80,

                                                        margin: EdgeInsets.all(2),
                                                        child: Column(
                                                          children: <Widget>[
                                                            GestureDetector(
                                                                child: CircleAvatar(
                                                                  child: Image.asset('${emotionImage[index]}'),
                                                                ),
                                                                onTap: () {
                                                                  FeelID = index+1;
                                                                  print(FeelID);
                                                                }
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(top: 10.0),
                                                              child: Text('${emotion[index]}',
                                                                style: TextStyle(fontSize: 14),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    }
                                                )
                                            )
                                          ],
                                        ),
                                      ),

                                      Positioned(
                                        bottom: 10.0,
                                        right: 30.0,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          textColor: Colors.white,
                                          color: Colors.blue,
                                          onPressed: () {

                                          },
                                          child: Text('OK', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                                        ),
                                      ),

                                      Positioned(
                                        bottom: 10.0,
                                        left: 30.0,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          textColor: Colors.white,
                                          color: Colors.blue,
                                          onPressed: () {
                                            AppNavigator.navigateBack();
                                          },
                                          child: Text('Hủy', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            );
                          }
                      );
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Image.asset("assets/emoji.png",scale: 1.5,),
                    padding: EdgeInsets.all(10),
                    shape: CircleBorder(),
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Image.asset("assets/speed.png",scale: 1.5,),
                    padding: EdgeInsets.all(10),
                    shape: CircleBorder(),
                    onPressed: () {
                      getActive();
                      showDialog(
                        context: context,
                        builder: (context) {

                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            child: Container(
                              height: 350,
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Hoạt động", style: TextStyle(fontSize: 18),),
                                        SizedBox(height: 30,),
                                        Container(
                                            height: 160,
                                            width: 150,
                                            child: actives == null ? Center(
                                              child: Container(
                                                height: 200,
                                                width: 200,
                                                child: Text("Danh sách rỗng"),
                                              ),
                                            ) : ListView.builder(
                                                padding: const EdgeInsets.all(8),
                                                itemCount: actives.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                  return Container(
                                                    height: 50,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                        border: Border(bottom: BorderSide(width: 1.5))
                                                    ),
                                                    margin: EdgeInsets.all(2),
                                                    child: Center(
                                                      child: GestureDetector(
                                                          child: Text('${actives[index].activeName}',
                                                            style: TextStyle(fontSize: 16),
                                                          ),
                                                          onTap: () {
                                                            print('${actives[index]}');
                                                          }
                                                      ),
                                                    ),
                                                  );
                                                }
                                            )
                                        )
                                      ],
                                    ),
                                  ),

                                  Positioned(
                                    bottom: 10.0,
                                    right: 30.0,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      textColor: Colors.white,
                                      color: Colors.blue,
                                      onPressed: () {

                                      },
                                      child: Text('OK', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                                    ),
                                  ),

                                  Positioned(
                                    bottom: 10.0,
                                    left: 30.0,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      textColor: Colors.white,
                                      color: Colors.blue,
                                      onPressed: () {
                                        AppNavigator.navigateBack();
                                      },
                                      child: Text('Hủy', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                                    ),
                                  )
                                ],
                              )
                            ),
                          );
                        }
                      );
                    },
                  ),
                ],
              ),
            )
          ),
        ],
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
