import 'package:booksapp/models/bookmodel.dart';
import 'package:booksapp/services/bookservice.dart';
import 'package:flutter/material.dart';

class addbook extends StatefulWidget {
  const addbook({super.key});

  @override
  State<addbook> createState() => _addbookState();
}

class _addbookState extends State<addbook> {
  Future<List<Posts>>?data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=BookApiService().getPosts();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(leading: Icon(Icons.arrow_back),),
        body:FutureBuilder(
            future: data, builder: (context,snapshot){
              if(snapshot.hasData && snapshot.data!.isNotEmpty)
              {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                    itemBuilder: (value,index)
                    {
                      return Card(child: Column(children: [
                        ListTile(
                          title: Text("Book Title"+snapshot.data![index].bookname.toString()),
                          subtitle: Text("Book Author"+snapshot.data![index].bookauthor.toString()+"\n"+"Book Price"+snapshot.data![index].bookprice.toString()+"\n"+"Book Publisher"+snapshot.data![index].bookpublisher.toString()),
                          leading: CircleAvatar(child: Text(snapshot.data![index].bookname.toString()[0]),),
                        )

                      ],
                      ),
                      );
                    }
                );
              }
              else
              {
                return CircularProgressIndicator();
              }
        }
        ),
      ),
    );
  }
}
