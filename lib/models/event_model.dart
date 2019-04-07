class EventModel{
  final String name;
  final String location;
  final String description;
  final String time;
  final String creater;
  final int eventStatus;

  EventModel({this.name, this.location, this.description, this.time, this.creater, this.eventStatus});

  factory EventModel.fromJson(Map<String,dynamic> json){
    return EventModel(
      name:json['name'],
      location:json['location'],
      description:json['description'],
      time:json['time'],
      creater:json['creater'],
      eventStatus:json['eventStatus'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = name;
    map["location"] = location;
    map["description"] = description;
    map["time"] = time;
    map["creater"] = creater;
    map["eventStatus"] = eventStatus;
    return map;
  }
}