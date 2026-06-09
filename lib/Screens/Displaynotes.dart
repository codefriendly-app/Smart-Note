import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        body: Column(
          children: [
            Text('Notes'),
            Expanded(
              child: ListView.builder(
                itemCount: shoppingnote.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(shoppingnote[index]['title']),
                      ),
                      trailing: IconButton(onPressed: (){
                        showDialog(context: context, builder: (context){
                          return editDialog(id: shoppingnote[index]['id'], title: shoppingnote[index]['title']);
                        });
                      }, icon: Icon(Icons.edit)),
                    );
                  }),
            )
          ],
        ),
     );
  }
}