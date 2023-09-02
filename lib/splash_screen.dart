import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multirole/home_screen.dart';
import 'package:multirole/login_screen.dart';
import 'package:multirole/student_screen.dart';
import 'package:multirole/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isLogin();
  }

  void isLogin() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType =sp.getString('UserType') ?? '';

    if(isLogin){
      if(userType == 'Student'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StudenScreen()));
        });
      }else if(userType == 'Teacher'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TeacherScreen()));
        });
      }else {
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      }
    }else{
      Timer(Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage('https://anestisxasapotaverna.gr/wp-content/uploads/2021/12/ARTICLE-3.jpg'),
      ),
    );
  }
}