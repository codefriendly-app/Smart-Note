import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_rdy_app/Provider/databseprovider.dart';
import 'package:job_rdy_app/Screens/Homescreen.dart';
import 'package:provider/provider.dart';

import '../Constants/Constant.dart';

class Addnotes extends StatelessWidget{
  List categoryes =[
    'Work','Study','Idea','Shopping'
    ];
  String selectedcategory  = 'Work';
  late final  String getcategory;
  TextEditingController noteController = TextEditingController();
   @override
  Widget build(BuildContext context){
     final provider = Provider.of<Databaseprovider>(context);
     return Scaffold(backgroundColor: Colors.brown,
       body: SafeArea(
           child: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.only(top: 10),
               child: Column(
                 children: [
                   Row(
                     children: [
                       IconButton(onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
                       }, icon:Icon(Icons.arrow_back,color: Colors.white,size: 30,)),
                       Expanded(
                         child: Container(
                           height: 100,
                           decoration: BoxDecoration(
                             image: DecorationImage(image: AssetImage('assets/images/note.png')),
                           ),
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 20,),
                   SizedBox(
                     height: 650,
                     width: double.maxFinite,
                     child: Container(
                       height: 650,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                       ),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20,right: 20),
                         child: Column(
                           children: [
                             Text('ADD NOTES',style: heading2,),
                             SizedBox(height: 30,),
                             TextField(
                               controller:noteController,
                               decoration: InputDecoration(
                                 hintText: 'Add note here',
                               ),
                             ),
                             SizedBox(height: 50,),
                             DropdownButton(
                                 isExpanded: true,
                                 value: selectedcategory,
                                 items: categoryes.map((category){
                                   return DropdownMenuItem(
                                       value: category,
                                       child: Text(category));
                                 }).toList(), onChanged: (value){
                               getcategory = value.toString();
                               selectedcategory = value.toString();
                             }),
                             SizedBox(height: 50,),
                             ElevatedButton(style:loginbt,onPressed: ()async{
                               final note = noteController.text;
                               final category = getcategory.toString();
                               await provider.notesend(note,category);
                             }, child: Text('Add note',style: heading2.copyWith(color: Colors.white),))
                           ],
                         ),
                       ),
                     ),
                   )
                 ],
               ),
             ),
           )
       )
     );
   }
}