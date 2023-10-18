
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week4_project/main.dart';
import 'package:week4_project/screens/home.dart';

class ScreenLogin extends StatefulWidget {
   ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isDataMatching = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.grey[300],
     appBar: AppBar(
      backgroundColor: Colors.black,
      title: Text("Login Page",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: 'Inspiration',
      ),
      ),
      centerTitle: true,
      leading: Icon(Icons.login_outlined),
     ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),

              SizedBox(
                height: 20,
              ),

              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),  
              ),

               SizedBox(
                height: 20, 
               ),

               Visibility(
                visible: !_isDataMatching,
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
               
                   Text("Username and Password doesn't match", style: TextStyle(color: Colors.red)),
                  ], 
                 ),
               ),

              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)
                ),
                onPressed: (){
                  checkLogin(context);
                }, 
                icon: Icon(Icons.check), 
                label: Text("Log in"))
              
            ],),
        ),
      )
    );
  }

  void checkLogin(BuildContext ctx) async
  {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    final _preDefUsername = "ABCD";
    final _preDefPassword = "EFGH123";
    if(_username== _preDefUsername && _password== _preDefPassword)
    {
      //Goto Home

      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(save_key_name, true);

      Navigator.of(ctx)
      .pushReplacement(MaterialPageRoute(builder: (ctx1)=> ScreenHome()));
      
    }else{
      //Snackbar

      // ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      //   behavior: SnackBarBehavior.floating,
      //   margin: EdgeInsets.all(10),
      //   duration: Duration(seconds: 10),
      //   backgroundColor: Colors.red[800],
      //   showCloseIcon: true,
      //   closeIconColor: Colors.white,
      //   content: Text("Username and Password does not match")
        
      //   ));

       //Alert Dialogue or pop up
       showDialog(
        context: ctx, 
        builder: (ctx1){
         return AlertDialog(
          title: Text("Log in failed",style: TextStyle(color: Colors.red),),
          content: Text("Username and Password does not match"),
          actions: [
            TextButton(
              onPressed: (){
              Navigator.of(ctx1).pop();
            }, 
            child: Text("Close"))
          ],
        );
       });


       //Show Text
       
       setState(() {
         _isDataMatching = false;
       });
        
    }
  }
}