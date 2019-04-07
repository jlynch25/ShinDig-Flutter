
class RegisterModel{
  final String username;
  final String password;
  final String email;

  RegisterModel({this.username, this.email, this.password});

  factory RegisterModel.fromJson(Map<String,dynamic> json){
    return RegisterModel(
      username:json['username'],
      password:json['password'],
      email:json['email']
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = username;
    map["password"] = password;
    map["email"] = email;
 
    return map;
  }
}

class LoginModel{
  final String username;
  final String password;
  //final String email;

  LoginModel({this.username, this.password});

  factory LoginModel.fromJson(Map<String,dynamic> json){
    return LoginModel(
      username:json['username'],
      password:json['password'],
     // email:json['email']
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = username;
    map["password"] = password;
    //map["email"] = email;
 
    return map;
  }
}
