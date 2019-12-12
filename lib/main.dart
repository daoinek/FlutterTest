import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';




void main() => runApp(MyBadApp());

class MyBadApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text('My Bad App'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.open_in_browser),
                onPressed: () {
                  _launchURL();
                  print("Click");
                },)
            ],
            backgroundColor: Colors.green
        ),
        body: CustomBackground(),
      ),
    );
  }

}




class CustomBackground extends StatefulWidget {
  @override
  CustomBackgroundState createState() => CustomBackgroundState();
}

class CustomBackgroundState extends State<CustomBackground> {
 // int _tapCounter = 0;
  Color newColor = Colors.white;

  Random random = new Random();

  void changeIndex() {
    setState(() => newColor = Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255)));
  }


  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        setState(() {
          changeIndex();
          print("Click");
        });
      },
      child: Container(
        color: newColor,
        child: Center(
            child: Text("Hey there!",
                style: TextStyle(
                    fontSize: 30.0
                )
            )
        ),
      ),
    );
  }

}


_launchURL() async {
  const url = 'https://solid.software/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
