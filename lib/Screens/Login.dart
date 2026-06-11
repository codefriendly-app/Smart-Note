import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_rdy_app/Constants/Constant.dart';
import 'package:job_rdy_app/Provider/Authprovider.dart';
import 'package:job_rdy_app/Screens/Homescreen.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  TextEditingController emailController  = TextEditingController();
  TextEditingController passwordController  = TextEditingController();
  @override
  Widget build(BuildContext context){
    final provider = Provider.of<Authprovider>(context);
    return Scaffold(backgroundColor: Colors.white60,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(image: AssetImage('assets/images/login.png'),height: 150,),
                SizedBox(height: 10,),
                Text('Welcome Back',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black54),),
                Padding(
                  padding: const EdgeInsets.only(top:30,right: 20,left: 20),
                  child: Container(height: 420,
                    padding: EdgeInsets.all(10),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black,offset: Offset(1, 1),blurRadius: 3),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:15,left: 15),
                          child: Text('Email address',style: TextStyle(fontSize:18,fontWeight: FontWeight.w500)),
                        ),SizedBox(height:5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(prefixIcon: Icon(Icons.email_outlined,),enabledBorder: UnderlineInputBorder(),
                              hint: Text('your.email@gmail.com',style: TextStyle(fontSize: 20,color: Colors.black38),),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(top:15,left: 15),
                    child: Text('Password',style: TextStyle(fontSize:18,fontWeight: FontWeight.w500))),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: TextField(
                            obscureText: true,
                            controller:passwordController,
                            decoration: InputDecoration(prefixIcon: Icon(Icons.lock_open,),enabledBorder: UnderlineInputBorder(),suffixIcon: Icon(Icons.remove_red_eye_outlined),
                              hint: Text('password',style: TextStyle(fontSize: 20,color: Colors.black38),),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: ElevatedButton(style:loginbt ,
                              onPressed:()async{
                               final email = emailController.text;
                               final password = passwordController.text;
                               await provider.login(email, password);
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
            
                              },
                              child:Text('Login',style: heading2.copyWith(color: Colors.white),)),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: ElevatedButton(
                              style:regitbt,
                              onPressed: ()
                              {
                                final email = emailController.text;
                                final password = passwordController.text;
                                provider.registration(email, password);
                              },
                              child: Text('Registration',style: heading2.copyWith(color:Colors.black),)),
                        ),
            
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}