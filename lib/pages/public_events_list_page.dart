import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './event_page.dart';

var currentUser = '5c90e62b274a4d796fd19fde';

class PublicEventsListPage extends StatefulWidget {
  @override
  _PublicEventsListPageState createState() => _PublicEventsListPageState();
}

class _PublicEventsListPageState extends State<PublicEventsListPage> {
 

var friendsData = new Map();
List publicEventsDataList ;

 

 @override
void initState(){
  super.initState();
  this.getPublicEventsList();
}


 Future<String> getPublicEventsList() async {
    await http.get('http://danu7.it.nuigalway.ie:8633/events/public/'+currentUser,)
    //  headers: {"Acccept":"application/json"}
      .then((http.Response response) {
        print(response.body);
        setState((){
        //friendsData= json.decode(response.body)['publicEvents'];
        //['friends']['recipient'];
        // print(json.decode(response.body)['user']);
        publicEventsDataList = new List.from(json.decode(response.body)['publicEvents']);
        print(publicEventsDataList);
        });
      });
  return "Success";
}

  
 @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(255, 196, 61,1.0),
      body: new CustomScrollView(
        
        slivers: <Widget>[
          new SliverAppBar(
            backgroundColor: Color.fromRGBO(255, 196, 61,1.0),
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.all( 50.0),
              title: new Text("Public Events \n \n Coming up soon",style: TextStyle(
                        color: Colors.white,
                        ),
                        ),
              //titlePadding: EdgeInsets.only(bottom: 50.0), 
              // background: Image.network(
              //       "https://htmlcolorcodes.com/assets/images/html-color-codes-color-tutorials-hero-00e10b1f.jpg",
              //       fit: BoxFit.cover,
              //     )
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
                  decoration: BoxDecoration(color: Color.fromRGBO(101, 216, 184,1.0)),
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
                      publicEventsDataList[index]['description']
                      +"\n\n\n"+
                      publicEventsDataList[index]['location'],
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EventPage(eventID: publicEventsDataList[index]['_id'])),//friendsDataList[index]['recipient']['_id'])),
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
    childCount: publicEventsDataList == null ? 0 : publicEventsDataList.length,


            ),
          ),
        ],
      )
      
    );
  //   return new MaterialApp(
  //     home: new Scaffold( 
  //       // appBar: Text("Public Events"),
                    
  //       body:  new ListView.builder(
  //   itemCount: publicEventsDataList == null ? 0 : publicEventsDataList.length,
  //   itemBuilder: (BuildContext context, int index){
  //     return new Container(
  //       child: new Center(
  //         child: new Column(
  //           crossAxisAlignment: CrossAxisAlignment.stretch,
  //           children: <Widget>[
  //             new Card(
  //               elevation: 8.0,
  //               margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  //               child: Container(
  //                 decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
  //                 child: ListTile(
  //                   contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  //                   leading: Container(
  //                     padding: EdgeInsets.only(right: 12.0),
  //                     decoration: new BoxDecoration(
  //                         border: new Border(
  //                             right: new BorderSide(width: 1.0, color: Colors.white24))),
  //                     child: Icon(Icons.insert_emoticon, color: Colors.white),
  //                   ),
  //                   title: Text(
  //                     publicEventsDataList[index]['location'],
  //                     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //                   ),
  //                   onTap: () {
  //                     Navigator.push(
  //                           context,
  //                           MaterialPageRoute(builder: (context) => EventPage(eventID: publicEventsDataList[index]['_id'])),
  //                         );
  //                   },
  //           ),
  //               ),
  //             ),
  //             new Card(
  //                 color: Colors.cyan,
  //                 child: Container(
  //                   width: 250.0,
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: <Widget>[
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: <Widget>[
  //                             Icon(Icons.insert_invitation, color: Colors.yellowAccent,),
  //                             Icon(Icons.more_vert, color: Colors.grey,),
  //                           ],
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: <Widget>[
  //                             Padding(
  //                               padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
  //                               child: Text(publicEventsDataList[index]['location'], style: TextStyle(color: Colors.grey),),
  //                             ),
  //                             Padding(
  //                               padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
  //                               child: Text(publicEventsDataList[index]['time'], style: TextStyle(fontSize: 28.0),),
  //                             ),
  //                             Padding(
  //                               padding: const EdgeInsets.all(8.0),
  //                               //child: LinearProgressIndicator(value: cardsList[position].taskCompletion,),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(10.0)
  //                 ),
                  
  //               ),
  //           ],
            
  //         ),
  //         ),
  //     );
  //   }
  // )
  //     ),
  //   );     
  }
}
