
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_rdy_app/Provider/databseprovider.dart';
import 'package:provider/provider.dart';
class editDialog extends StatelessWidget {
 final String id;
 final String title;
  editDialog({
   required this.id, required this.title
});
  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController(
      text: title
    );
    return AlertDialog(
      title: Text('Edit Note'),
      content: TextField(
        controller: editingController ,
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('Cancel')),

        TextButton(onPressed: (){
          Provider.of<Databaseprovider>(context,listen: false).editnote(id, editingController.text);
          Navigator.pop(context);
        }, child:Text('Save')),
      ],
    );
  }
}