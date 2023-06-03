import 'package:arwa_quiz_f/controller/ApiController.dart';
import 'package:arwa_quiz_f/pojo/Response.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: Container(
          padding: EdgeInsets.all(20),
          child: FutureBuilder<List<Users>>(
            future: ApiController().getAllUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data != null &&
                  snapshot.data!.isNotEmpty) {
                return ListView.builder(
                    itemCount: snapshot.data!.length ,
                    itemBuilder: (context, index) => Card(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              Image.network(
                                "${snapshot.data![index].image}",
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 20,),
                              Text(
                                  "${snapshot.data![index].firstName} ${snapshot.data![index].lastName}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 10,),
                              Text("${snapshot.data![index].bio}",textAlign: TextAlign.center,),
                              SizedBox(height: 20,)
                            ],
                          ),
                        ));
              } else {
                return Center(
                  child: Text("no data found"),
                );
              }
            },
          ),
        ));
  }
}
