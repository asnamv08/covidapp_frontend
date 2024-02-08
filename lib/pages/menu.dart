import 'package:booksapp/pages/addbook.dart';
import 'package:booksapp/pages/viewbooks.dart';
import 'package:flutter/material.dart';

class menu extends StatelessWidget {
  const menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(child: Column(children: [
        ElevatedButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>views()));
        }, child: Text("Add Books")),
        SizedBox(height: 10,),
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>addbook()));
        }, child: Text("View Books"))
      ],),),
    );
  }
}
