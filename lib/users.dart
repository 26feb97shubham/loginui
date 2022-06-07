class User {
  String? _username;
  String? _email;
  String? _password;
  String? _flaglogged;

  User(this._username, this._email, this._password, this._flaglogged);

  User.map(dynamic obj) {
    this._username = obj['username'];
    this._email = obj['email'];
    this._password = obj['password'];
    this._flaglogged = obj['flaglogged'];
  }

  String get username => _username!;
  String get email => _email!;
  String get password => _password!;
  String get flaglogged => _flaglogged!;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["email"] = _email;
    map["password"] = _password;
    map["flaglogged"] = _flaglogged;
    return map;
  }
}
