import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:booksapp/models/bookmodel.dart';

class BookApiService
{
  Future<dynamic>senddata(
 String title,String author,String price,String publisher,
      ) async{
    var client=http.Client();
    var apiurl=Uri.parse("http://localhost:3001/api/booksapp/add");
    var response=await client.post(apiurl,
        headers: <String,String>{
        "Content-Type":"application/json; charset=UTF-8"
        },
        body:jsonEncode(<String,String>{
          "bookname":title,
          "bookauthor":author,
          "bookprice":price,
          "bookpublisher":publisher

    }));
    if(response.statusCode==200)
    {
      return jsonDecode(response.body);
    }
    else
    {
      throw Exception("Failed To Send Data");
    }

  }

  Future<List<Posts>> getPosts()async{
    var client=http.Client();
    var apiurl=Uri.parse("http://localhost:3001/api/booksapp/view");
    var response=await client.get(apiurl);
    if(response.statusCode==200)
    {
      return postsFromJson(response.body);
    }
    else
    {
      return [];
    }
  }
}