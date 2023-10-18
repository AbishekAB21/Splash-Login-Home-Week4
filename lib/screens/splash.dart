import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week4_project/main.dart';
import 'package:week4_project/screens/home.dart';
import 'package:week4_project/screens/login.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {

 @override
  void initState() {
    checkuserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/images/Assassins_Creed.jpg',
        height: 500,
        )
        
        ,),);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotoLogin() async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> ScreenLogin()));
  }


  Future<void> checkuserLoggedIn() async{
    final _sharedprefs = await SharedPreferences.getInstance();
    final _userLoggedIn= _sharedprefs.getBool(save_key_name);
    if(_userLoggedIn==null || _userLoggedIn==false)
    {
      gotoLogin();
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx1)=>ScreenHome()));
    }
  }  
}