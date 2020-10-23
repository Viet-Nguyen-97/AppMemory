class Active{
  int _id;
  String _activeName;

  Active(this._activeName);
  Active.WithID(this._id,this._activeName);

  int get id => _id;
  String get activeName => _activeName;

  set activeName(String newActiveName){
    _activeName = newActiveName;
  }

  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
    map["activename"] = _activeName;

    if(_id != null){
      map["id"] = _id;
    }
    return map;
  }

  Active.fromObject(dynamic o){
    this._id = o["id"];
    this._activeName = o["activename"];
  }
}