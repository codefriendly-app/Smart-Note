import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_rdy_app/Constants/Constant.dart';
import 'package:job_rdy_app/Provider/databseprovider.dart';
import 'package:job_rdy_app/Screens/Addnotes.dart';
import 'package:job_rdy_app/Screens/Displaynotes.dart';
import 'package:job_rdy_app/Widgets/showdialog.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget{
  
  //TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context){
    final provider = Provider.of<Databaseprovider>(context);
    final pinnedNotes = provider.notelist
        .where((note) => note['pinned'] == true)
        .toList();
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.lightGreen,
          child:Icon(Icons.edit_note),onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Addnotes()));
      }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                /// Header
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage:
                      NetworkImage(
                          "https://i.pravatar.cc/150"),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "Hello, Alex!",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight:
                            FontWeight.bold),
                      ),
                    ),

                    Stack(
                      children: [
                        Icon(Icons.notifications_none,
                            size: 30),

                        Positioned(
                          right: 0,
                          child: Container(
                            padding:
                            EdgeInsets.all(5),
                            decoration:
                            BoxDecoration(
                              color: Colors.red,
                              shape:
                              BoxShape.circle,
                            ),
                            child: Text(
                              "3",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),

                SizedBox(height: 25),

                /// Search

                Container(
                  padding:
                  EdgeInsets.symmetric(
                      horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                      hintText: "Search Notes...",
                    ),
                  ),
                ),

                SizedBox(height: 20),

                /// Categories

                SingleChildScrollView(
                  scrollDirection:
                  Axis.horizontal,
                  child: Row(
                    children: [

                      InkWell(
                        child: categoryItem(Icons.work,
                            "Work"),
                        onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Displaynotes(select: 'Work')));
                        },
                      ),

                      InkWell(
                        child: categoryItem(Icons.menu_book,
                            "Study"),
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Displaynotes(select: 'Study')));
                        },
                      ),

                      InkWell(
                        child: categoryItem(Icons.lightbulb,
                            "Ideas"),
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Displaynotes(select: 'Ideas')));
                        },
                      ),

                      InkWell(
                        child: categoryItem(Icons.shopping_cart,
                            "Shopping"),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Displaynotes(select: 'Shopping',)));
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  "Pinned Notes",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection:
                    Axis.horizontal,
                    itemCount: pinnedNotes.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 170,
                        margin:
                        EdgeInsets.only(
                            right: 15),
                        padding:
                        EdgeInsets.all(15),
                        decoration:
                        BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius
                              .circular(
                              20),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                            children: [
                          
                              Icon(Icons.note_alt,
                                  size: 35),
                          
                              Text(
                                pinnedNotes[index]
                                ["title"],
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                ),
                              ),
                          
                              SizedBox(
                                  height: 10),
                          
                              Text(
                                pinnedNotes[index]['category']
                                ,
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 25),

                Text(
                  "Recent Notes",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                ListView.builder(
                  shrinkWrap: true,
                  physics:
                  NeverScrollableScrollPhysics(),
                  itemCount: provider.notelist.length ,
                  itemBuilder: (context, index) {
                    final data = provider.notelist[index];
                    return Container(
                      margin:
                      EdgeInsets.only(
                          bottom: 12),
                      padding:
                      EdgeInsets.all(15),
                      decoration:
                      BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                        BorderRadius
                            .circular(
                            15),
                      ),
                      child: Row(
                        children: [

                          Container(
                            width: 5,
                            height: 40,
                            color: Colors.black,
                          ),

                          SizedBox(width: 10),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              children: [
                                Text( data['title'],
                                  style:
                                  TextStyle(
                                    fontSize:
                                    20,
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          IconButton(
                            icon: Icon(
                              data['pinned']
                                  ? Icons.push_pin
                                  : Icons.push_pin_outlined,
                            ),
                            onPressed: () {
                              provider.pinNote(
                                data['id'],
                                !data['pinned'],
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  }
Widget categoryItem(IconData icon, String title) {
  return InkWell(
    child: Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20),
          SizedBox(width: 5),
          Text(title),
        ],
      ),
    ),
  );
}