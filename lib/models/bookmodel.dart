// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

List<Posts> postsFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
  String id;
  String bookname;
  String bookauthor;
  String bookprice;
  String bookpublisher;
  int v;

  Posts({
    required this.id,
    required this.bookname,
    required this.bookauthor,
    required this.bookprice,
    required this.bookpublisher,
    required this.v,
  });

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    id: json["_id"],
    bookname: json["bookname"],
    bookauthor: json["bookauthor"],
    bookprice: json["bookprice"],
    bookpublisher: json["bookpublisher"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "bookname": bookname,
    "bookauthor": bookauthor,
    "bookprice": bookprice,
    "bookpublisher": bookpublisher,
    "__v": v,
  };
}
