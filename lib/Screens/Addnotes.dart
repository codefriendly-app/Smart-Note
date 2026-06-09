import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_rdy_app/Provider/databseprovider.dart';
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
           child: Column(
             children: [
               TextField(
                 controller:noteController,
                 decoration: InputDecoration(
                   hintText: 'Add note here',
                 ),
               ),
               SizedBox(height: 20,),
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
               SizedBox(height: 30,),
               ElevatedButton(style:loginbt,onPressed: ()async{
                 final note = noteController.text;
                 final category = getcategory.toString();
                 await provider.notesend(note,category);
               }, child: Text('Add note',style: heading2,))
             ],
           )
       )
     );
   }
}