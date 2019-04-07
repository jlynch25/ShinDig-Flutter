import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'login_page.dart';
import 'today_page.dart';
import '../routes/user_route.dart';
import '../animations/loader.dart';

// import 'package:sweetalert/sweetalert.dart';
// import 'package:sweetalert/src/cancel.dart';
// import 'package:sweetalert/src/success.dart';



// var username;
// var password;
// var email;



class RegisterPage extends StatefulWidget {
  @override
  State createState() => new RegisterPageState();
}

class RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

   final _usernameController = TextEditingController();
   final _passwordController = TextEditingController();
   final _emailController = TextEditingController();


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
                            labelText: "Email"),
                        keyboardType: TextInputType.emailAddress, style: new TextStyle(color:Colors.black), 
                        controller: _emailController
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                            labelText: "UserName"),
                        keyboardType: TextInputType.text, style: new TextStyle(color:Colors.black), 
                        controller: _usernameController
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Password",
                          fillColor: Colors.black
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text, style: new TextStyle(color:Colors.black), 
                        controller: _passwordController
                      ),
                      // new TextFormField(
                      //   decoration: new InputDecoration(
                      //     labelText: "ReEnter Password",
                      //     fillColor: Colors.black
                      //   ),
                      //   obscureText: true,
                      //   keyboardType: TextInputType.text, style: new TextStyle(color:Colors.black), 
                      // ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                      ),
                      new MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.green,
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        child: new Text("Sign Up"),
                        //child: new Icon(FontAwesomeIcons.signInAlt),
                        onPressed: () async {

                        registerPost(_usernameController.text, _passwordController.text, _emailController.text);

                          if(statusCode==200){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TodayPage()),
                              );
                            }
                        
                          //print('username: ${_usernameController.text}, password: ${_passwordController.text}');
                        //   loading() {
                        //   return FutureBuilder(
                        //         future: RegisterPost(_usernameController.text, _passwordController.text, _emailController.text),
                        //         builder: (BuildContext context, snapshot) {
                        //           if (snapshot.connectionState == ConnectionState.done){
                        //             if (snapshot.hasError){
                        //                   // SweetAlert.show(context,
                        //                   // title: "Just show a message",
                        //                   // subtitle: "Sweet alert is pretty",
                        //                   // style: SweetAlertStyle.error);
                        //                   return new ColorLoader5();
                        //             }
                        //             else{
                        //               // SweetAlert.show(context,
                        //               //   title: "Just show a message",
                        //               //   subtitle: "Sweet alert is pretty",
                        //               //   style: SweetAlertStyle.success);
                        //               return new ColorLoader5();
                        //               // Navigator.push(
                        //               //   context,
                        //               //   MaterialPageRoute(builder: (context) => HomePage()),
                        //               // );
                        //             }
                        //           } else{
                        //             // SweetAlert.show(context,
                        //             //     title: "Just show a message",
                        //             //     subtitle: "Sweet alert is pretty",
                        //             //     style: SweetAlertStyle.loading);
                        //               return new Container(
                        //                           height: 150.0,
                        //                           width: 150.0,
                        //                           child: CircularProgressIndicator(),
                        //                         );
                        //           }
                                  
                        //         }
                        //   );
                        //  }

                        //  loading();
                         },

                      ),
                       new Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                      ),
                      new RaisedButton(
                        child: Text('Already a member? LogIn'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
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


//  Navigator.push(
//                                             context,
//                                             MaterialPageRoute(builder: (context) => HomePage()),
//                                           );