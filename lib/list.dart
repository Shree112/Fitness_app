import 'dart:async';
import 'dart:math' as math;
import 'redirect.dart';
import 'package:flutter/material.dart';
import 'tile.dart';
import 'package:demo_project/main.dart';
class Listexercise extends StatelessWidget {
 List b;
 List l1;
 
   List l2;
  Listexercise({this.b,this.l1,this.l2});
  List<String> time=new List();
 
  Widget build(BuildContext context) {
    for(int i =  0 ; i < 5 ;i++)
           {
             int j = int.parse(b[i]);
             time.add(l2[j-1]);
             
           }
              
         
    return
     Scaffold(appBar: AppBar(
       title : Text('List of exercises'),
       centerTitle : true,
       actions: <Widget>[
         RaisedButton(onPressed: ()  {
         },
  
         child:Text('Start'),
         ),
       ],
     ),
     body :
       ListView.builder(
      itemCount: b.length,
      itemBuilder: (context,index)
      {
        
      int j = int.parse(b[index]);
 
       return ExerciseTile(
          name: l1[j-1],
          alpha: l2[j-1],
        );
        
     ///print(j);
    }
    
       
      
      ) ,
   );
      
    
  }
}