import '../models/event_model.dart';
import 'dart:async';
//import 'dart:convert';
import 'package:http/http.dart' as http;


int statusCode = 0;


Future<void> eventPost(name, location, description, time, creater, eventStatus) async {
        EventModel newPost = new EventModel(
                        name: name,
                        location: location, 
                        description: description, 
                        time: time, 
                        creater: creater, 
                        eventStatus: eventStatus);
                        var body = newPost.toMap();
    http.post( 'http://danu7.it.nuigalway.ie:8633/events/', body: body).then((http.Response response) {
  statusCode = response.statusCode;
  });
}
