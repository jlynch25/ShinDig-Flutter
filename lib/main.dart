import 'package:flutter/material.dart';

import 'services/auth_service.dart';

import './pages/home_login_page.dart';
import './pages/login_page.dart';
import './pages/register_page.dart';
import './pages/profile_page.dart';
import './pages/friends_page.dart';
import './pages/public_events_list_page.dart';
import './pages/today_page.dart';
import './pages/create_event_page.dart';
import './pages/date_time.dart';


AuthService appAuth = new AuthService();


void main() async {
  // Set default home.
  Widget _defaultHome = new HomeLoginPage();

  // Get result of the login function.
  bool _result = await appAuth.login();
  if (_result) {
    _defaultHome = new TodayPage();
  }





  runApp(new MaterialApp(
    theme: new ThemeData(primarySwatch: Colors.blue),
    home: new HomeLoginPage(),
  )
  );

}

