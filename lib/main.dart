
import 'package:flutter/material.dart';
import 'package:week4_project/screens/splash.dart';

const save_key_name = 'UserLoggedIn';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Project',
     theme: ThemeData(
      primarySwatch: Colors.blue,
     ),
     home: ScreenSplash(),

    );
  }
}