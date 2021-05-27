import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List<String> _values = ["", "", "", "", "", "", "", "", ""];
  List<int> x = [];
  List<int> o = [];
  int count = 0;
  bool visibility = true;
  String k = "";

  String result() {
    if ((x.contains(0) & x.contains(1) & x.contains(2)) |
        (x.contains(3) & x.contains(4) & x.contains(5)) |
        (x.contains(6) & x.contains(7) & x.contains(8)) |
        (x.contains(0) & x.contains(3) & x.contains(6)) |
        (x.contains(2) & x.contains(5) & x.contains(8)) |
        (x.contains(1) & x.contains(7) & x.contains(4)) |
        (x.contains(0) & x.contains(4) & x.contains(8)) |
        (x.contains(2) & x.contains(4) & x.contains(6))) {
      visibility = false;
      k = "X won";

      return k;
    } else if ((o.contains(0) & o.contains(1) & o.contains(2)) |
        (o.contains(3) & o.contains(4) & o.contains(5)) |
        (o.contains(6) & o.contains(7) & o.contains(8)) |
        (o.contains(0) & o.contains(3) & o.contains(6)) |
        (o.contains(2) & o.contains(5) & o.contains(8)) |
        (o.contains(1) & o.contains(7) & o.contains(4)) |
        (o.contains(0) & o.contains(4) & o.contains(8)) |
        (o.contains(2) & o.contains(4) & o.contains(6))) {
      visibility = false;
      k = "O WON";

      return k;
    } else if (count == 9) {
      visibility = false;
      k = "DRAW";

      return k;
    } else {
      visibility = true;
      k = "";
      return k;
    }
  }

  bool _tap = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("Tic-Tac-Toe"),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: visibility,
                child: Center(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              count++;
                              print(index);
                              if (_tap) {
                                _values[index] = "X";
                                x.add(index);
                                _tap = false;
                              } else {
                                _values[index] = "O";
                                o.add(index);
                                _tap = true;
                              }
                              print(x);
                              print(o);
                            },
                          );
                        },
                        child: Container(
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              _values[index],
                              style: TextStyle(
                                  fontSize: height * 0.15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    result(),
                    style: TextStyle(
                      fontSize: height * 0.05,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _values = ["", "", "", "", "", "", "", "", ""];
                    x = [];
                    o = [];
                    _tap = true;
                    visibility = true;
                    k = "";
                    count = 0;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    color: Colors.white,
                    height: height * 0.1,
                    width: width * 0.7,
                    child: Center(
                      child: Text(
                        "Start a new game",
                        style: TextStyle(
                            fontSize: height * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
