import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'searchChangeNotifier.dart';
import 'SearchList.dart';

TextEditingController _textEditingController = TextEditingController();

class searchRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<SearchState>(context);

    int xsearch = appState.getSearchState;
    String xrecipe = appState.getString;

    Color c1 = Color.fromRGBO(255, 175, 55, 100);
    Color c2 = Color.fromRGBO(120, 155, 255, 100);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: new Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: _width/2+60+_height/6,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: c2,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[Container(padding:EdgeInsets.only(left: _width/16,top: _height/13,),child: Text("Search Recipes",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Colors.black87),),),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: _width / 16),
                          search1(context),
                          SizedBox(width: _width / 16),
                          search2(context),
                          SizedBox(width: _width / 16),
                          search3(context)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  searchBar(context),
                  SizedBox(
                    height: 2,
                  ),
                  searchButton(context),
                  SearchRecipeListView(xsearch, xrecipe),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget search1(BuildContext context) {
  final appState = Provider.of<SearchState>(context);
  double _width = MediaQuery.of(context).size.width;
  double _height = MediaQuery.of(context).size.height;
  Color c1 = Color.fromRGBO(255, 205, 105, 1);
  Color c2 = Color.fromRGBO(120, 155, 255, 100);
  double bw = 0;
  if (appState.getSearchState == 1) bw = 3;
  return GestureDetector(
    onTap: () {
      appState.setSelect(1);
    },
    child: Container(
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "SEARCH",
            style: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Text(
            "by dish",
            style: TextStyle(
                fontSize: 11, color: Colors.black, fontWeight: FontWeight.w400),
          )
        ],
      )),
      height: _width / 4,
      width: _width / 4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: c1,
          border: Border.all(color: Colors.black, width: bw)),
    ),
  );
}


Widget search2(BuildContext context) {
  final appState = Provider.of<SearchState>(context);
  double _width = MediaQuery.of(context).size.width;
  double _height = MediaQuery.of(context).size.height;
  Color c1 = Color.fromRGBO(255, 205, 105, 1);
  Color c2 = Color.fromRGBO(120, 155, 255, 100);
  double bw = 0;
  if (appState.getSearchState == 2) bw = 3;
  return GestureDetector(
    onTap: () {
      appState.setSelect(2);
    },
    child: Container(
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "SEARCH",
            style: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Text(
            "by ingredients",
            style: TextStyle(
                fontSize: 11, color: Colors.black, fontWeight: FontWeight.w400),
          )
        ],
      )),
      height: _width / 4,
      width: _width / 4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: c1,
          border: Border.all(color: Colors.black, width: bw)),
    ),
  );
}


Widget search3(BuildContext context) {
  final appState = Provider.of<SearchState>(context);
  double _width = MediaQuery.of(context).size.width;
  double _height = MediaQuery.of(context).size.height;
  Color c1 = Color.fromRGBO(255, 205, 105, 1);
  Color c2 = Color.fromRGBO(120, 155, 255, 100);
  double bw = 0;
  if (appState.getSearchState == 3) bw = 3;
  return GestureDetector(
    onTap: () {
      appState.setSelect(3);
    },
    child: Container(
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "SEARCH",
            style: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          Text(
            "by nutrients",
            style: TextStyle(
                fontSize: 11, color: Colors.black, fontWeight: FontWeight.w400),
          )
        ],
      )),
      height: _width / 4,
      width: _width / 4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: c1,
          border: Border.all(color: Colors.black, width: bw)),
    ),
  );
}

Widget searchBar(BuildContext context) {
  final appState = Provider.of<SearchState>(context);
  double _width = MediaQuery.of(context).size.width;
  String str;
  if (appState.getSearchState == 1)
    str = "by dish";
  else if (appState.getSearchState == 2)
    str = "by ingredients";
  else if (appState.getSearchState == 3) str = "by nutrients";

  double _height = MediaQuery.of(context).size.height;
  return Row(
    children: <Widget>[
      SizedBox(width: _width / 16),
      Container(
        decoration: BoxDecoration(
            color: Colors.white70, borderRadius: BorderRadius.circular(30)),
        width: _width * 7 / 8,
        padding: EdgeInsets.only(right: _width / 16, left: _width / 16),
        child: Row(
          children: <Widget>[
            Icon(Icons.search),
            SizedBox(
              width: 15,
            ),
            Container(
                width: _width * 5 / 8,
                child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                        labelText: "search " + str,
                        labelStyle: TextStyle(fontSize: 12)),
                    style: TextStyle(fontSize: 20)))
          ],
        ),
      ),
    ],
  );
}

Widget searchButton(BuildContext context) {
  final appState = Provider.of<SearchState>(context);
  double _width = MediaQuery.of(context).size.width;
  double _height = MediaQuery.of(context).size.height;
  Color c1 = Color.fromRGBO(255, 175, 55, 100);
  Color c2 = Color.fromRGBO(120, 155, 255, 100);
  return GestureDetector(
    onTap: () {
      appState.setString(_textEditingController.text);
      _textEditingController.text="";
      FocusScope.of(context).requestFocus(new FocusNode());

    },
    child: Row(
      children: <Widget>[
        SizedBox(
          width: _width / 35,
        ),
        ButtonBar(
          children: <Widget>[
            Card(
                elevation: 10,
                child: Container(
                    decoration: BoxDecoration(color: c1),
                    padding: EdgeInsets.only(bottom: 15, top: 15),
                    width: _width / 2,
                    child: Text(
                      "SEARCH",
                      style: TextStyle(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    )))
          ],
        ),
      ],
    ),
  );
}

class SearchRecipeListView extends StatelessWidget {
  int x;
  String s;

  SearchRecipeListView(this.x, this.s);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Center(
        child: SizedBox(height: _height / 1.9, child: SearchList(x, s)));
  }
}
