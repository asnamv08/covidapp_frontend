import 'package:booksapp/services/bookservice.dart';
import 'package:flutter/material.dart';

class views extends StatefulWidget {
  const views({super.key});

  @override
  State<views> createState() => _viewsState();
}

class _viewsState extends State<views> {
  TextEditingController getTitle=new TextEditingController();
  TextEditingController getAuthor=new TextEditingController();
  TextEditingController getPrice=new TextEditingController();
  TextEditingController getPublisher=new TextEditingController();
  void Sendvaluetoapi()async{
    final response=await BookApiService().senddata(
      getTitle.text,
      getAuthor.text,
      getPrice.text,
      getPublisher.text,
    );
    if(response["status"]=="success")
    {
      print("successfully");
    }
    else
    {
      print("error");
    }


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body:Container(padding: EdgeInsets.all(20),child: Column(children: [
      TextField(controller: getTitle,decoration: InputDecoration(labelText: ("Book Name"),hintText: ("enter  book name"),border: OutlineInputBorder()),),
      SizedBox(height: 10,),
      TextField(controller: getAuthor,decoration: InputDecoration(labelText: ("Author"),hintText: ("enter author name"),border: OutlineInputBorder()),),
      SizedBox(height: 10,),
      TextField(controller: getPrice,decoration: InputDecoration(labelText: ("Price"),hintText: ("enter price"),border: OutlineInputBorder()),),
      SizedBox(height: 10,),
      TextField(controller: getPublisher,decoration: InputDecoration(labelText: ("Publisher"),hintText: ("enter publisher"),border: OutlineInputBorder()),),
      SizedBox(height: 10,),
      SizedBox(
        width: 250,
        height: 60,
        child: ElevatedButton(style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
        ),onPressed: Sendvaluetoapi,
            child: Text("Submit")),
      ),
      SizedBox(height: 10,),
      SizedBox(
        width: 250,
        height: 60,
        child: ElevatedButton(style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
        ),onPressed: ()
        {
          Navigator.pop(context);
        }, child: Text("Back")),
      )
    ],),),


    ),);
  }
}
