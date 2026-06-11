import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
class Databaseprovider extends ChangeNotifier{
  Databaseprovider(){
    fetchnote();
  }
  List<Map<String, dynamic>> notelist = [];
  String? Uid = FirebaseAuth.instance.currentUser?.uid;
  late DatabaseReference reference = FirebaseDatabase.instance.ref('users').child(Uid!).child('notes');
  Future<void> notesend(String note,String  category)async{
   await reference.push().set({
      'title':note,
     'category':category,
     'pinned':false,
   });
   notifyListeners();
  }
  Future<void> fetchnote()async{
    await reference.onValue.listen((event){
      notelist.clear();
      if(event.snapshot.value!=null){
        final map  = Map<dynamic ,dynamic>.from(
          event.snapshot.value as Map,
        );
        map.forEach((key ,value){
          if(value!=null){
            notelist.add({
              'id':key,
              'title':value['title']??'',
              'category':value['category']??'',
              'pinned':value['pinned']?? false,
            });
          }
        });
      }
      notifyListeners();

    });
  }
  Future<void> editnote(String id,String newnote  )async{
      reference.child(id).update({
        'title':newnote,
      });
      notifyListeners();
  }

  Future<void> pinNote(String id, bool pin) async {
    await reference.child(id).update({
      'pinned': pin,
    });
  }
  Future<void> delete(String id)async{
    await reference.child(id).remove();
    notelist.removeWhere((note)=>
      note['id']==id);
      notifyListeners();
  }
}