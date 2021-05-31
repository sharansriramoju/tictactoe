import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      k = "O Won";

      return k;
    } else if (count == 9) {
      visibility = false;
      k = "Draw";

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
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "Tic-Tac-Toe",
            style: GoogleFonts.badScript(
              textStyle: TextStyle(
                color: Color(0xffF4F3F3),
                fontSize: width * 0.1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFf4f9f9),
              const Color(0xFF000000),
            ],
            begin: const FractionalOffset(2.0, 2.0),
            end: const FractionalOffset(2.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: visibility,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
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
                                if (x.contains(index) | o.contains(index)) {
                                } else {
                                  count++;
                                  if (_tap) {
                                    _values[index] = "X";
                                    x.add(index);
                                    _tap = false;
                                  } else {
                                    _values[index] = "O";
                                    o.add(index);
                                    _tap = true;
                                  }
                                }
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffF4F3F3),
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              _values[index],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.badScript(
                                textStyle: TextStyle(
                                    fontSize: height * 0.1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: visibility ? Colors.transparent : Color(0xffF4F3F3),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: width * 0.3,
                child: Center(
                  child: Text(
                    result(),
                    style: GoogleFonts.badScript(
                      textStyle: TextStyle(
                        fontSize: height * 0.05,
                        color: visibility ? Color(0xfff4f9f9) : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
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
                    decoration: BoxDecoration(
                        color: Color(0xffF4F3F3),
                        borderRadius: BorderRadius.circular(15)),
                    height: height * 0.1,
                    width: width * 0.7,
                    child: Center(
                      child: Text(
                        "Reset Game",
                        style: GoogleFonts.badScript(
                          textStyle: TextStyle(
                            fontSize: height * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
