import 'list.dart';
import 'package:flutter/material.dart';

class Redirect extends StatelessWidget {
   var list = ['1','2','3','4','5','6','7','8','9','10'];
   var list1 = ['crunches','bench press','push ups','dumbells','squats','lunges','burpees','medicine ball','leg press','situps'];
   var list2 = ['2','6','9','12','15','18','21','24','27','30'];
  
  @override
  Widget build(BuildContext context) {
    
    return Center(child: RaisedButton.icon(onPressed: (){  getRandomElement(list,list1,list2,context);
  }, icon: Icon(Icons.list), label: Text('Surprise me'))
      
    );
  }

getRandomElement (List list , List list1 , List list2 , BuildContext context) {

 /* for (var i = 0; i < 5; i++)
  {
    var i = random.nextInt(list.length);
   
    
    print(list[i]);}*/
    list.shuffle();
    List b = list.sublist(0,5);
    print(b);
  Navigator.of(context).push(
             MaterialPageRoute(
               builder: (context) => Listexercise(b : b, l1: list1, l2 : list2),
             ));

 
}
   
}

