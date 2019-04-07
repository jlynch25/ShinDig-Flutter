import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class EventPage extends StatefulWidget {
String eventID = "null";

EventPage({Key key, this.eventID}) : super (key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  var data = new Map();


  @override
  void initState(){
    super.initState();
    this.getEvent();
  }


  Future<String> getEvent() async {
      await http.get('http://danu7.it.nuigalway.ie:8633/events/event/'+"${widget.eventID}",)
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
    return 
      new Text(data['description'] );
  }
}
