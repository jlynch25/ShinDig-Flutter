import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'today_page.dart';
import 'register_page.dart';

import '../routes/user_route.dart';






class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

   final _usernameController = TextEditingController();
   final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      backgroundColor: Colors.deepOrangeAccent[200],
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        // new Image(
        //   image: new AssetImage("assets/girl.jpeg"),
        //   fit: BoxFit.cover,
        //   colorBlendMode: BlendMode.darken,
        //   color: Colors.black87,
        // ),
        new Theme(
          data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: new InputDecorationTheme(
                // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                labelStyle:
                    new TextStyle(color: Colors.tealAccent, fontSize: 25.0),
              )),
          isMaterialAppTheme: true,
          child: new ListView(
             shrinkWrap: true,
            
            children: <Widget>[
              new Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                      ),
              new FlutterLogo(
                size: _iconAnimation.value * 140.0,
              ),
              new Container(
                padding: const EdgeInsets.all(40.0),
                child: new Form(
                  autovalidate: true,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                            labelText: "UserName"),
                        keyboardType: TextInputType.text , style: new TextStyle(color:Colors.black),
                        controller: _usernameController
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Password"
                        ),
                        // validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                        obscureText: true,
                        keyboardType: TextInputType.text, style: new TextStyle(color:Colors.black),
                        controller: _passwordController
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                      ),
                      new MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                            color: Colors.orangeAccent,
                            child: new Text("LOGIN", 
                                style: TextStyle(
                                    color: Colors.white
                                ),
                            ),
                            textColor: Colors.white,
                        
                        //child: new Icon(FontAwesomeIcons.signInAlt),
                        onPressed:() {
                             loginPost(_usernameController.text, _passwordController.text);
                         
                            if(statusCode==200){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TodayPage()),
                              );
                            }
                          // loading() {
                          // return FutureBuilder(
                          //       future: login(_usernameController.text, _passwordController.text),
                          //       builder: (BuildContext context, snapshot) {
                          //         if (snapshot.connectionState == ConnectionState.done){
                          //           if (snapshot.hasError){
                          //                 // SweetAlert.show(context,
                          //                 // title: "Just show a message",
                          //                 // subtitle: "Sweet alert is pretty",
                          //                 // style: SweetAlertStyle.error);
                          //               //  return new ColorLoader5();
                          //           }
                          //           else{
                          //             // SweetAlert.show(context,
                          //             //   title: "Just show a message",
                          //             //   subtitle: "Sweet alert is pretty",
                          //             //   style: SweetAlertStyle.success);
                          //           //  return //new ColorLoader5();
                          //             // Navigator.push(
                          //             //   context,
                          //             //   MaterialPageRoute(builder: (context) => HomePage()),
                          //             // );
                          //           }
                          //         } else{
                          //           // SweetAlert.show(context,
                          //           //     title: "Just show a message",
                          //           //     subtitle: "Sweet alert is pretty",
                          //           //     style: SweetAlertStyle.loading);
                          //             return new MaterialButton(
                          //                         height: 50.0,
                          //                         minWidth: 150.0,
                          //                         color: Colors.yellow,
                          //                         splashColor: Colors.teal,
                          //                         textColor: Colors.black,
                          //                         child: new Text("Done"));
                          //         }
                                  
                          //       }
                          // );
                        //  }

                        //  loading();      
                        // MaterialPageRoute(builder: (context) => home new  Homepage())
                         }
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                      ),
                      new RaisedButton(
                        child: Text('Not a member? Sign Up'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
                          );
                      },
                     )         
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

// Future _showAlert(BuildContext context, String message) async {
//                             return showDialog(
//                                 context: context,
//                                 child: new AlertDialog(
//                                   title: new Text(message),
//                                   actions: <Widget>[
//                                     new RaisedButton(
//                                       child: Text('home Page'),
//                                       onPressed: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(builder: (context) => HomePage()),
//                                         );
//                                       }
//                                     )
//                                   ],
//                                 )

//                             );
// }