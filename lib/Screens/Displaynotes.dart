import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_rdy_app/Constants/Constant.dart';
import 'package:job_rdy_app/Provider/databseprovider.dart';
import 'package:job_rdy_app/Widgets/showdialog.dart';
import 'package:provider/provider.dart';

class Displaynotes extends StatelessWidget{
  String select;
  Displaynotes({required this.select});
  @override
  Widget build(BuildContext context){
    final provider = Provider.of<Databaseprovider>(context);
    final shoppingnote = provider.notelist.where((note)=>
      note['category']==select).toList();
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text('Notes',style: heading1,),
              Expanded(
                child: ListView.builder(
                  itemCount: shoppingnote.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight:Radius.circular(15) ),
                              color: Colors.white,
                            ),
                            child: ListTile(
                              title: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                    child: Text(shoppingnote[index]['title'])),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(onPressed: (){
                                    showDialog(context: context, builder: (context){
                                      return editDialog(id: shoppingnote[index]['id'], title: shoppingnote[index]['title']);
                                    });
                                  }, icon: Icon(Icons.edit,color: Colors.green,)),
                                  SizedBox(width: 10,),
                                  IconButton(onPressed: (){
                                    provider.delete(shoppingnote[index]['id']);
                                  }, icon: Icon(Icons.delete,color: Colors.red,)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
     );
  }
}