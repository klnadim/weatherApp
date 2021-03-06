import 'package:flutter/material.dart';
import 'package:weather_app/pages/home.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                icon: Icon(Icons.home),
                label: Text(""))
          ],
        ),
      ),
    );
  }
}
