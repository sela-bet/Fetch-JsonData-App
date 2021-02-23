import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Users {
  final int id;
  final int albumId;
  final String title;
  final String image;
  Users({this.id, this.albumId, this.title, this.image});
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        id: json["id"],
        albumId: json["albumId"],
        title: json["title"],
        image: json["url"]);
  }
}

Future<List<Users>> fetchUser(http.Client client) async {
  final response =
      await client.get("https://jsonplaceholder.typicode.com/photos");
  return compute(parsePhoto, response.body);
}

List<Users> parsePhoto(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Users>((json) => Users.fromJson(json)).toList();
}
