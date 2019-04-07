import 'package:flutter/material.dart';

import 'profile_page.dart';
import 'public_events_list_page.dart';
import 'create_event_page.dart';
import 'my_profile_page.dart';
import 'event_page.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

var currentUser = "5c90e62b274a4d796fd19fde";

class TodayPage extends StatefulWidget {

TodayPage({Key key, this.onLayoutToggle})
      : super(key: key);
  //final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {

var eventsData = new Map();
List eventsDataList ;



 @override
void initState(){
  super.initState();
  this.getEventsList();
}


 PageController _controller = new PageController(initialPage: 1, viewportFraction: 1.0);


 Future<String> getEventsList() async {
    await http.get('http://danu7.it.nuigalway.ie:8633/users/eventslist/'+currentUser,)
    //  headers: {"Acccept":"application/json"}
      .then((http.Response response) {
        //print(response.body);
        setState((){
        eventsData= json.decode(response.body)['user'];
        //['friends']['recipient'];
        // print(json.decode(response.body)['user']);
        eventsDataList = new List.from(eventsData['events']);
        print(eventsDataList[0]['eventID']['location']);
        });
      });
  return "Success";
}



    TodaysEventsPage(){
    return new Scaffold(
      backgroundColor: Color.fromRGBO(101, 216, 184,1.0),
      body: new CustomScrollView(
        
        slivers: <Widget>[
          new SliverAppBar(
            backgroundColor: Color.fromRGBO(101, 216, 184,1.0),
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.all( 50.0),
              title: new Text("Hi, Jen \n \nyou have ${eventsDataList.length} events today",style: TextStyle(
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
              new SliverChildBuilderDelegate((context, index) =>
            //    new ListTile(
            //     title: new Text("list"),
            // )
            
   // this.childCount: friendsDataList == null ? 0 : friendsDataList.length,
    // itemBuilder: (BuildContext context, int index){
       new Container(
        child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Card(
                elevation: 20.0,
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
                      child: Icon(Icons.event, color: Colors.white),
                    ),
                    title: Text(
                      //"Event Name \n\n Event Time \n\n Event location",
                      eventsDataList[index]['eventID']['description'],
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EventPage(eventID: eventsDataList[index]['eventID']['_id'])),//friendsDataList[index]['recipient']['_id'])),
                          );
                    },
            ),
                ),
              )
            ],
          ),
          ),
      ),
    
     childCount: eventsDataList == null ? 0 : eventsDataList.length,


            ),
          ),
        ],
      )
      
    );
  }




  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,

        child: PageView(
          controller: _controller,
          physics: new AlwaysScrollableScrollPhysics(),
          children: <Widget>[PublicEventsListPage(), TodaysEventsPage(),MyProfilePage(), CreateEventPage()],
          scrollDirection: Axis.horizontal,
        ));
  }
}