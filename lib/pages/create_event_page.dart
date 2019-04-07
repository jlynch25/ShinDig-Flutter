import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import '../routes/event_route.dart';
import 'event_page.dart';

var currentUser = "5c90e62b274a4d796fd19fde";







class CreateEventPage extends StatefulWidget {


  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {

  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _timeController = TextEditingController();
  final eventStatus = 1;
  
  bool public = false;

//date/time picker
final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
  };

  InputType inputType = InputType.both;
  bool editable = false;
  DateTime date;



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
  appBar: new AppBar(
    title: new Text("New Event"),
    actions: <Widget>[
     // new IconButton(icon: const Icon(Icons.save), onPressed: () {})
    ],
  ),
  body: 
  new ListView(
    shrinkWrap: true,
    children: <Widget>[
      new ListTile(
        leading: const Icon(Icons.turned_in),
        title: new TextField(
          decoration: new InputDecoration(
            hintText: "Name",
          ),
          controller: _nameController
        ),
      ),
      new ListTile(
        leading: const Icon(Icons.description),
        title: new TextField(
          decoration: new InputDecoration(
            hintText: "description",
          ),
          controller: _descriptionController
        ),
      ),
      new ListTile(
        leading: const Icon(Icons.location_on),
        title: new TextField(
          decoration: new InputDecoration(
            hintText: "location",
          ),
          controller: _locationController
        ),
      ),
      new  ListTile(
        leading: const Icon(Icons.access_time),
      title: DateTimePickerFormField(
              inputType: inputType,
              format: formats[inputType],
              editable: editable,
              decoration: InputDecoration(
                  labelText: 'Date/Time', hasFloatingPlaceholder: false),
              onChanged: (dt) => setState(() => date = dt),
              controller: _timeController
            ),
      ),
      new  ListTile(
      leading: const Icon(Icons.public),
      title:  SwitchListTile(
        title: Text(public == false ? "Private" : "Public"),
        value: public,
        onChanged: (bool val) => setState(() => public = val),
      ),
      ),
      // const Divider(
      //   height: 1.0,
      // ),
      // new ListTile(
      //   leading: const Icon(Icons.group),
      //   title: const Text('Contact group'),
      //   subtitle: const Text('Not specified'),
      // )
      new Padding(
        padding: const EdgeInsets.only(top: 60.0),
      ),
      new MaterialButton(
        height: 50.0,
        minWidth: 150.0,
            color: Colors.orangeAccent,
            child: new Text("CREATE", 
                style: TextStyle(
                    color: Colors.white
                ),
            ),
            textColor: Colors.white,
          onPressed:() {
                             eventPost(_nameController.text, _locationController.text, _descriptionController.text,_timeController.text, currentUser, eventStatus);
                         
                            if(statusCode==200){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EventPage()),
                              );
                            }
          }
      ),
    ],
  ),
);
  }
}