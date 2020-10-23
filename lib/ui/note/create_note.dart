import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memorylife/navigator/navigator.dart';
import 'package:flutter_picker/flutter_picker.dart';

class CreateNewNote extends StatefulWidget {
  CreateNewNote({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CreateNewNoteState createState() => _CreateNewNoteState();
}

class _CreateNewNoteState extends State<CreateNewNote> {
  Icon searchIcon = new Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
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
          title: Text("Ghi chú", style: TextStyle(fontSize: 18, color: Colors.blue),),

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
                    labelText: 'Tiêu đề',
                    alignLabelWithHint: true,
                  ),
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                ),
              ),
            ),

            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Nhập ghi chú',
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
              left: 20,
              bottom: 20,
              child: FloatingActionButton(
                onPressed: () {
                  showPickerDateCustom(context);
                },
                child: Icon(Icons.alarm, color: Colors.white,),
              ),
            ),
          ],
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  showPickerDateCustom(BuildContext context) {
    new Picker(
        hideHeader: true,
        adapter: new DateTimePickerAdapter(
          minValue: DateTime.now(),
          customColumnType: [2,1,0,3,4],
        ),
        title: new Text("Chọn thời gian"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print((picker.adapter as DateTimePickerAdapter).value);
        }
    ).showDialog(context);
  }
}
