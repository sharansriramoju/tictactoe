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
  List<String> symbol = ["", "", "", "", "", "", "", "", ""];
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
              image: AssetImage(
                "assets/x.jpg",
              ),
              fit: BoxFit.cover),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("tic tac toe"),
      ),
      body: Container(
        height: height,
        color: Colors.black87,
        child: Center(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_image == false) {
                        symbol[index] = "x";
                        _image = true;
                      } else {
                        symbol[index] = "o";
                        _image = false;
                      }
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        symbol[index],
                        style: TextStyle(
                          fontSize: 120,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
