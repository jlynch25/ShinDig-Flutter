import '../models/user_model.dart';
import 'dart:async';
//import 'dart:convert';
import 'package:http/http.dart' as http;


int statusCode = 0;


Future<void> registerPost(username, password, email) async {
        RegisterModel newPost = new RegisterModel(
                         username:username,
                        password:password,
                        email:email);
                        var body = newPost.toMap();
    http.post( 'http://danu7.it.nuigalway.ie:8633/users/register', body: body).then((http.Response response) {
  statusCode = response.statusCode;
  });
}

Future<void> loginPost(username, password) async {
        LoginModel newPost = new LoginModel(
                         username:username,
                        password:password);
                        var body = newPost.toMap();
    http.post( 'http://danu7.it.nuigalway.ie:8633/users/login', body: body).then((http.Response response) {
  statusCode = response.statusCode;
  });
}







// void login(username, password) async {

//   Future<LoginModel> createPost(String url, {Map body}) async {
//   return http.post(url, body: body).then((http.Response response) {
//     statusCode = response.statusCode;
 
//     if (statusCode == 200) {
//     // If server returns an OK response, parse the JSON
//      LoginModel.fromJson(json.decode(response.body));
//   } 
//   else if(statusCode == 401) {
   
//    }
//   else {
//     // If that response was not OK, throw an error.
//     throw Exception('Failed to load post');
//   }
//   });
// }

//  LoginModel newPost = new LoginModel(   
//                         username:username,
//                         password:password);
//                         await createPost(
//                         'http://danu7.it.nuigalway.ie:8633/users/login',
//                         body: newPost.toMap());              
// }



