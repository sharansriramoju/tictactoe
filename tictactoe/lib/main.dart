import 'package:flutter/material.dart';
import 'package:tictactoe/game.dart';

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
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Tic-Tac-Toe"),
        backgroundColor: Colors.black45,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Game())),
            child: Container(
              height: height * 0.15,
              width: width * 0.7,
              color: Colors.white38,
              child: Center(
                child: Text(
                  "Start the game",
                  style: TextStyle(fontSize: height * 0.05),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
