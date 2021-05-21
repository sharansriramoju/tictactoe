import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _image = false;
  Widget myWidget() {
    if (_image == false) {
      return Container(
        width: 200,
        height: 200,
        color: Colors.white,
      );
    } else if (_image == true) {
      return Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "https://static.techgrapple.com/wp-content/uploads/2016/08/red-sky-whatsapp-chat-theme.jpg",
              ),
              fit: BoxFit.cover),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("tic tac toe"),
      ),
      body: Container(
        color: Colors.black87,
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _image = true;
              });
            },
            child: myWidget(),
          ),
        ),
      ),
    );
  }
}
