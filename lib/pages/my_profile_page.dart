import 'package:flutter/material.dart';
import 'friends_page.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

var currentUser = "5c90e62b274a4d796fd19fde";

class MyProfilePage extends StatefulWidget {
String userID = "null";

MyProfilePage({Key key, this.userID}) : super (key: key);


  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {

  var data = new Map();


  @override
  void initState(){
    super.initState();
    this.getUser();
  }


  Future<String> getUser() async {
      await http.get('http://danu7.it.nuigalway.ie:8633/users/'+currentUser,)
      //  headers: {"Acccept":"application/json"}
        .then((http.Response response) {
          print(response.body);
          setState((){
            data = json.decode(response.body)['user'];
          });
    });
    return "Success";
  }


  @override
  Widget build(BuildContext context) {
    var alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          
          backgroundImage: AssetImage('../assets/moss.jpg'),
        ),
      ),
    );

    var welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        data['user_name'],
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        data['email']+
        "\n\nYou're doing great",
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

 final navList = new RaisedButton(
    child: Text('Friends'),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FriendsPage(userID: currentUser)),//"${widget.userID}")),
      );
    }
  );

    var body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[alucard, welcome, lorem, navList],
      ),

    );


    return Scaffold(
      body: body,
    );
  }
}