import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 1;

  void getDataAPI() async {
    var url = "https://jsonplaceholder.typicode.com/posts";

    Response response = await get(Uri.parse(url));

    var data = jsonDecode(response.body) as List;
    Map<String, dynamic> mapData = data[0];
    print(mapData);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Started Apps");
    getDataAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              "Counter: ${counter}",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   label: Text("Approve"),
      //   icon: Icon(Icons.library_add_check_outlined),
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("+"),
      ),
    );
  }
}
