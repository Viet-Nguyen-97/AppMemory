class User{
  int _id;
  String _username ;
  String _nickname ;
  String _avatar_image ;
  String _background_image ;
  String _intro ;
  String _gender ;
  String _dob;
  String _email ;
  String _phonenumber ;
  String _password ;
  String _pincode ;

  User(this._username,this._avatar_image,this._background_image,this._nickname,this._intro,this._gender,
      this._dob,this._email,this._phonenumber,this._password,this._pincode);

  User.WithID(this._id,this._username,this._avatar_image,this._background_image,this._nickname,this._intro,
      this._gender, this._dob,this._email,this._phonenumber,this._password,this._pincode);


  int get id => _id;
  String get username => _username;
  String get avatar_image => _avatar_image;
  String get background_image => _background_image;
  String get nickname => _nickname;
  String get intro => _intro;
  String get gender => _gender;
  String get dob => _dob;
  String get email => _email;
  String get phonenumber => _phonenumber;
  String get password => _password;
  String get pincode => _pincode;

  set username(String newusername){
    _username = newusername;
  }
  set avatar_image(String newavatar){
    _avatar_image = newavatar;
  }
  set background_image(String newbackground){
    _background_image = newbackground;
  }
  set nickname(String newnickname){
    _nickname = newnickname;
  }
  set intro(String newintro){
    _intro = newintro;
  }
  set gender(String newgender){
    _gender = newgender;
  }
  set dob(String newdob){
    _dob = newdob;
  }
  set email(String newemail){
    _email = newemail;
  }
  set phonenumber(String newphonenumber){
    _phonenumber = newphonenumber;
  }
  set password(String newpassword){
    _password = newpassword;
  }
  set pincode(String newpincode){
    _pincode = newpincode;
  }

  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
    map["username"] = _username;
    map["avatar_image"] = _avatar_image;
    map["background_image"] = _background_image;
    map["nickname"] = _nickname;
    map["intro"] = _intro;
    map["gender"] = _gender;
    map["dob"] = _dob;
    map["email"] = _email;
    map["phonenumber"] = _phonenumber;
    map["password"] = _password;
    map["pincode"] = _pincode;

    if(_id != null){
      map["id"] = _id;
    }
    return map;
  }

  User.fromObject(dynamic o){
    this._id = o["id"];
    this._username = o["username"];
    this._nickname = o["nickname"];
    this._avatar_image = o["avatar_image"];
    this._background_image = o["background_image"];
    this._intro = o["intro"];
    this._gender = o["gender"];
    this._dob = o["dob"];
    this._email = o["email"];
    this._phonenumber = o["phonenumber"];
    this._password = o["password"];
    this._pincode = o["pincode"];
  }
}