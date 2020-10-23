import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

class ImageLibrary extends StatefulWidget {
  @override
  _ImageLibraryState createState() => _ImageLibraryState();
}

class _ImageLibraryState extends State<ImageLibrary> {
  final double listSpec = 4.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String stateText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            (stateText != null) ? Text(stateText) : Container(),

            RaisedButton(
              child: Text('Picker Show Date (Custom)'),
              onPressed: () {
                showPickerDateCustom(context);
              },
            ),
          ],
        ),
      ),
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