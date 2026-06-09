import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job_rdy_app/Provider/Authprovider.dart';
import 'package:job_rdy_app/Provider/databseprovider.dart';
import 'package:job_rdy_app/Screens/Splash.dart';
import 'package:provider/provider.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>Authprovider()),
    ChangeNotifierProvider(create: (context)=>Databaseprovider()),
  ],child: MyApp(),));
}
class MyApp extends StatelessWidget{
  final String name = 'secreate data';

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home:Splash(),);
          }
}
class Textshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}