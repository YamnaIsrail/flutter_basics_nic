import 'package:flutter/material.dart';
import 'package:flutter_basics_nic/models/posts_model.dart';
import 'package:flutter_basics_nic/services/services_apis.dart';
import 'package:http/http.dart' as http;

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {

  Future<List<Temperatures>>? _future;

  //late List<Temperatures> temperatures = [];

  @override

  void initState(){
  super.initState();
  LoadData();
  }

//  Map<String, dynamic> body={};
  void LoadData() async{
    setState(() {
      _future= ServicesApis.GetAllPosts();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: _future,
          builder: (context, AsyncSnapshot<List<Temperatures>> snapshot) {
            if(snapshot.connectionState== ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            else if(snapshot.hasError){
              return Center(child: Text("${snapshot.error.toString()}"),);
            }
            else{
              if(snapshot.data!.length > 0){
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text("${snapshot.data![index].name}"),
                        subtitle: Text("${snapshot.data![index].city}"),
                      );;
                    });

              }
              else{
                Center(child: Text("Sorry no record found"),);
              }
              return Container();
            }
        },
        ),
      ),

    );
  }
}
