import 'package:flutter/material.dart';
import 'cardList.dart';
import 'package:flutter/services.dart';
import 'searchRecipe.dart';

Color c1 = Color.fromRGBO(255, 175, 55, 100);
Color c2 = Color.fromRGBO(120, 155, 255, 100);

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: c2, // navigation bar color
    statusBarColor: c2, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int x = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: ListView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          RecipySearchBar(),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 60),
            child: Row(
              children: <Widget>[
                Text(
                  "TOP RECIPES",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.black54),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(220, 220, 220, 0.6)),
                    child: IconButton(
                        color: Colors.black54,
                        icon: Icon(Icons.refresh),
                        onPressed: () {
                          setState(() {
                            x = 0;
                          });
                        }))
              ],
            ),
          ),
          RecipyListView(x)
        ],
      )),
    );
  }
}

class RecipyListView extends StatelessWidget {
  int x;

  RecipyListView(this.x);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Center(child: SizedBox(height: _height / 1.9, child: CardList(x)));
  }
}

class RecipySearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    Color c1 = Color.fromRGBO(255, 175, 55, 1);
    Color c2 = Color.fromRGBO(115, 145, 255, 100);
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        Stack(alignment: Alignment.bottomRight, children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 45),
            child: Container(
              width: _width,
              height: 90,
              color: c2,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => searchRecipe()),
                );
              },
              child: Container(
                  width: 160,
                  height: 50,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: c1,
                          blurRadius: 27.0, // soften the shadow
                          spreadRadius: 1.0, //extend the shadow
                          offset: Offset(
                            2.0, // Move to right 10  horizontally
                            2.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'Search',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ))),
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 22),
          child: Row(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: c2,
                  ),
                  child: Image.asset(
                    "assets/logo.png",
                    width: 45,
                    height: 45,
                  )),
              SizedBox(
                width: 15,
              ),
              Text(
                "MyPlate",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
