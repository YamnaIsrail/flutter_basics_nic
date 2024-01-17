import 'package:flutter/material.dart';
import 'package:flutter_basics_nic/models/posts_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ServicesApis {
  static var client = http.Client();


  static Future<List<Temperatures>> GetAllPosts() async {
    List<Temperatures> temperatures=[];
    String stringurl = "https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8";
    Uri Uri_url = Uri.parse(stringurl);

    Response response = await client.get(Uri_url);

    if (response.statusCode == 200) {
        temperatures = temperaturesFromMap(response.body).toList();
    }
    return temperatures;
  }
}