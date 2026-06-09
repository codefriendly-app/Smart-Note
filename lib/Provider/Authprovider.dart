import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_rdy_app/services/authservice.dart';

class Authprovider extends ChangeNotifier{
  Authservice authservice = Authservice();
  bool isLoading = false;
  // Registration
 Future<User?> registration(String email ,String password)async{
   try{
    await authservice.registration(email, password);
    notifyListeners();
   }catch(e){
     print(e.toString());
   }
   return null;
 }

 Future<User?> login(String email,String password)async{
   try{
     isLoading = true;
     notifyListeners();
    await authservice.login(email, password);
   }catch(e){
     print(e.toString());
   }
   finally{
     isLoading = false;
     notifyListeners();
   }
 }

}
