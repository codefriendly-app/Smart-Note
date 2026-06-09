import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_rdy_app/Screens/Homescreen.dart';
import 'package:job_rdy_app/Screens/Login.dart';

class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return SplashState();
  }
}
class SplashState extends State<Splash>{
  @override
  void initState() {
    super.initState();

    Timer((Duration(seconds: 2)), (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(Icons.edit_note,size: 60,),
             SizedBox(height: 20,),
             Text('Make Notes with us',style: TextStyle(color: Colors.black),),
           ],
         ),
       ),
    );
  }
}