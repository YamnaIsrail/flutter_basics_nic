import 'package:flutter/material.dart';
import 'package:flutter_basics_nic/models/posts_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {

  var client= http.Client();
  late List<Temperatures> temperatures = [];


  @override

  void initState(){
  super.initState();
  LoadData();
  }

//  Map<String, dynamic> body={};
  void LoadData() async{
    String stringurl= "https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8";

    Uri Uri_url= Uri.parse(stringurl);

    Response response= await client.get(Uri_url);

    if(response.statusCode==200){
      setState(() {
         temperatures = temperaturesFromMap(response.body).toList();
      });
      }

    print("object");

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: temperatures.length> 0
              ? ListView.builder(
              itemCount: temperatures.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text("${temperatures[index].name}"), // Update here
                  subtitle: Text("${temperatures[index].city}"), // Add if necessary
                );;
              })
              :CircularProgressIndicator()),
        ),

    );
  }
}
