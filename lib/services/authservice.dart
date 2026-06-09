import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Authservice{
  FirebaseAuth auth = FirebaseAuth.instance;
  // Registration
  Future<User?> registration(String email,String password)async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password);
       return userCredential.user;
    }catch(e){
      print(e.toString());
    }
    return null;
  }
  Future<User?>login(String email,String password)async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    }catch(e){
      print(e.toString());
    }
    return null;
  }
}