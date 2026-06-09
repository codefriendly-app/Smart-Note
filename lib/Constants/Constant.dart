
// Text
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final heading1  = TextStyle(fontSize: 24,fontWeight: FontWeight.bold);
final heading2  = TextStyle(fontSize: 18,fontWeight: FontWeight.w500);
final heading3 = TextStyle(fontSize: 18,fontWeight: FontWeight.w400);

//colors
const primary = TextStyle(color: Colors.black);
const secondary = TextStyle(color:Colors.white);

// buttons decoration
final loginbt = ElevatedButton.styleFrom(backgroundColor: Colors.black,elevation: 7,fixedSize: Size(double.maxFinite, 60),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
final regitbt = ElevatedButton.styleFrom(backgroundColor: Colors.white,elevation: 7,fixedSize: Size(double.maxFinite, 60),side: BorderSide(width: 1,color: Colors.black),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));

// Inputfeild
