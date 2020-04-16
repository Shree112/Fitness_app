import 'package:demo_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
class ExerciseTile extends StatelessWidget {
  String name ;
  String alpha;
  ExerciseTile({this.name,this.alpha});
  @override
  Widget build(BuildContext context) {
  //  print((int.parse(alpha)/60).floor());
  //  print((int.parse(alpha)%60).toString().padLeft(2,'0'));
    return Padding(
      padding:  EdgeInsets.only(top : 8.0),
      child:  FlipCard(
        direction: FlipDirection.VERTICAL,
        front : Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          onTap: (){
           /* Navigator.of(context).push(
             MaterialPageRoute(
               builder: (context) => MyApp(alpha),
             ));*/
          },
          title : Text(name),
        
         // subtitle: Text('${(int.parse(alpha)/60).floor()}:${(int.parse(alpha)%60).toString().padLeft(2,'0')}'),
        )),
        back : Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          onTap: (){
            /* Navigator.of(context).push(
             MaterialPageRoute(
               builder: (context) => MyApp(alpha),
             ));*/
          },
          //title : Text(name),
        
          title: Text('${(int.parse(alpha)/60).floor()}:${(int.parse(alpha)%60).toString().padLeft(2,'0')}'),
        )
        )
      ),
);
  }
}