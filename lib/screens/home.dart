


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week4_project/screens/login.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Home Screen",
        style: TextStyle(
          fontFamily: 'Inspiration',
          fontSize: 30,
        ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            signout(context );
          }, icon: Icon(Icons.exit_to_app_rounded))
        ],
      ),
      body: SafeArea(
        child:
     

        ListView(
          children: [
         
          ListTile(
            title: Text("Hello"),
            subtitle: Text("Hello world"),
            leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Assassins_Creed.jpg')
            ,),
           
          ),

          Divider( color: Colors.black, ),

           ListTile(
            title: Text("Hello"),
            subtitle: Text("Hello world"),
             leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Assassins_Creed.jpg',)
              
              ,),
            
            
          ),

          Divider( color: Colors.black, ),

           ListTile(
            title: Text("Hello"),
            subtitle: Text("Hello world"),
             leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Assassins_Creed.jpg')
              
              ,),
            
          ),

          Divider( color: Colors.black, ),

           ListTile(
            title: Text("Hello"),
            subtitle: Text("Hello world"),
             leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Assassins_Creed.jpg')
              
              ,),
          ),

          Divider( color: Colors.black, ),

           ListTile(
            title: Text("Hello"),
            subtitle: Text("Hello world"),
             leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Assassins_Creed.jpg')
              
              ,),
        
          ),

          Divider( color: Colors.black, ),

           ListTile(
            title: Text("Hello"),
            subtitle: Text("Hello world"),
             leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Assassins_Creed.jpg')
              
              ,),
          ),

          Divider( color: Colors.black, ),

           ListTile(
            title: Text("Hello"),
            subtitle: Text("Hello world"),
             leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Assassins_Creed.jpg')
              
              ,),
          ),

          Divider( color: Colors.black, ),

           ListTile(
            title: Text("Hello"),
            subtitle: Text("Hello world"),
             leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/Assassins_Creed.jpg')
              
              ,),
          ),


          ],
          )
       
        ),
    );
  }

  signout(BuildContext ctx) async
  {

    final _sharedprefs = await SharedPreferences.getInstance();
    await _sharedprefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1)=>ScreenLogin()), (route) => false);
  }
}