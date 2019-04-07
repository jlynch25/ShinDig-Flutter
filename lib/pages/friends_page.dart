import 'package:flutter/material.dart';

import '../routes/user_route.dart';
import './profile_page.dart';


import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//var currentUser = '5c90e62b274a4d796fd19fde';


class FriendsPage extends StatefulWidget {

  String userID = "null";

  FriendsPage({Key key, this.userID}) : super (key: key);

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {


var friendsData = new Map();
List friendsDataList ;

 

 @override
void initState(){
  super.initState();
  this.getFriendsList();
}


 Future<String> getFriendsList() async {
    await http.get('http://danu7.it.nuigalway.ie:8633/users/friendslist/'+"${widget.userID}",)
    //  headers: {"Acccept":"application/json"}
      .then((http.Response response) {
        //print(response.body);
        setState((){
        friendsData= json.decode(response.body)['user'];
        //['friends']['recipient'];
        // print(json.decode(response.body)['user']);
        friendsDataList = new List.from(friendsData['friends']);
       // print(friendsDataList[0]['recipient']['user_name']);
        });
      });
  return "Success";
}

  
//  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(101, 216, 184,1.0),
      body: new CustomScrollView(
        
        slivers: <Widget>[
          new SliverAppBar(
            backgroundColor: Color.fromRGBO(101, 216, 184,1.0),
            expandedHeight: 100.0,
            floating: true,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              // IconButton(icon: Icon(
              //         Icons.arrow_back),
              //         onPressed: () {
              //           moveToLastScreen();
              //         }
              //         ),
              title: new Text("Friends",style: TextStyle(
                        color: Colors.white,
                        ),
                        ),
              //titlePadding: EdgeInsets.only(bottom: 50.0), 
              background: Image.network(
                    "https://i.pinimg.com/originals/80/4c/52/804c52e5e0a9b9db5c72c122ed9481fe.jpg",
                    fit: BoxFit.cover,
                  )
            ),
            
          ),
          new SliverList(
            delegate:
              new SliverChildBuilderDelegate((BuildContext context, index) =>
            //    new ListTile(
            //     title: new Text("list"),
            // )
            
 // childCount: friendsDataList == null ? 0 : friendsDataList.length
    // itemBuilder: (BuildContext context, int index){
       new Container(
        child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Card(
                elevation: 8.0,
                margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(color: Color.fromRGBO(255, 196, 61,1.0)),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(width: 1.0, color: Colors.white24))),
                      child: Icon(Icons.insert_emoticon, color: Colors.white),
                    ),
                    title: Text(
                      //"wellll yess",
                      friendsDataList[index]['recipient']['user_name'],
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfilePage(userID: friendsDataList[index]['recipient']['_id'])),//friendsDataList[index]['recipient']['_id'])),
                          );
                    },
            ),
                ),
              )
            ],
          ),
          ),
      ),
    //}
    childCount: friendsDataList == null ? 0 : friendsDataList.length,


            ),
          ),
        ],
      )
      
    );
  }




// Widget _heroAppBar({BuildContext context,String titleText}){
//     return PreferredSize(
//       preferredSize: Size.fromHeight(kToolbarHeight),
      
//       child: Hero(
//           tag: 'friends_app_bar',
//           child: Builder(builder: (BuildContext context) {
                

//             return AppBar(
//                     elevation: 0.1,
//                     backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
                    
//                     title: Text(titleText),
//                     leading: IconButton(icon: Icon(
//                       Icons.arrow_back),
//                       onPressed: () {
//                         moveToLastScreen();
//                       }
//                       ),
//                     actions: <Widget>[
//                       IconButton(
//                         icon: Icon(Icons.list),
//                         onPressed: () {},
//                       )
//                     ],
//                   );
//           }
//         ),
//       ),
//     );
//   }

void moveToLastScreen() {
  Navigator.pop(context);
}



}


