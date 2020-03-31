import 'package:flutter/material.dart';

class searchRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return new Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 80),
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
          SizedBox(height: 25,),
          searchBar(context),
          SizedBox(height: 15,),
          searchButton(context),
        ],
      ),
    );
  }
}

Widget search1(BuildContext context) {
  double _width = MediaQuery.of(context).size.width;
  double _height = MediaQuery.of(context).size.height;
  Color c1 = Color.fromRGBO(255, 175, 55, 100);
  Color c2 = Color.fromRGBO(120, 155, 255, 100);
  return Container(child: Center(child: Column(mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Text("SEARCH",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w600),),
      Text("by dish",style: TextStyle(fontSize: 11,color: Colors.black,fontWeight: FontWeight.w400),)
    ],
  )),
    height: _width / 4,
    width: _width / 4,
    decoration:
    BoxDecoration(borderRadius: BorderRadius.circular(20), color: c1),
  );
}

Widget search2(BuildContext context) {
  double _width = MediaQuery.of(context).size.width;
  double _height = MediaQuery.of(context).size.height;
  Color c1 = Color.fromRGBO(255, 175, 55, 100);
  Color c2 = Color.fromRGBO(120, 155, 255, 100);
  return Container(child: Center(child: Column(mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Text("SEARCH",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w600),),
      Text("by ingredients",style: TextStyle(fontSize: 11,color: Colors.black,fontWeight: FontWeight.w400),)
    ],
  )),
    height: _width / 4,
    width: _width / 4,
    decoration:
    BoxDecoration(borderRadius: BorderRadius.circular(20), color: c1),
  );
}

Widget search3(BuildContext context) {
  double _width = MediaQuery.of(context).size.width;
  double _height = MediaQuery.of(context).size.height;
  Color c1 = Color.fromRGBO(255, 175, 55, 100);
  Color c2 = Color.fromRGBO(120, 155, 255, 100);
  return Container(child: Center(child: Column(mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Text("SEARCH",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.w600),),
      Text("by nutrients",style: TextStyle(fontSize: 11,color: Colors.black,fontWeight: FontWeight.w400),)
    ],
  )),
    height: _width / 4,
    width: _width / 4,
    decoration:
    BoxDecoration(borderRadius: BorderRadius.circular(20), color: c1),
  );
}

Widget searchBar(BuildContext context) {double _width = MediaQuery.of(context).size.width;
double _height = MediaQuery.of(context).size.height;
  return Row(
    children: <Widget>[SizedBox(width:_width/16),
      Container(decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(20)),width:_width*7/8,padding:EdgeInsets.only(right:_width/16,left: _width/16,top:5,bottom: 5),child:Row(children: <Widget>[Icon(Icons.search),SizedBox(width: 15,),Container(width:_width*5/8,child: TextField(decoration:InputDecoration(labelText: "search"),style: TextStyle(fontSize: 14)))],) ,),
    ],
  );
}

Widget searchButton(BuildContext context){
  double _width = MediaQuery.of(context).size.width;
  double _height = MediaQuery.of(context).size.height;
  Color c1 = Color.fromRGBO(255, 175, 55, 100);
  Color c2 = Color.fromRGBO(120, 155, 255, 100);
  return Row(
    children: <Widget>[SizedBox(width: _width/22,),
      ButtonBar(children: <Widget>[Card(elevation:10,child: Container(decoration: BoxDecoration(color: c1),padding:EdgeInsets.only(bottom:15,top:15),width: _width/2,child: Text("SEARCH",style: TextStyle(fontWeight: FontWeight.w600),textAlign: TextAlign.center,)))],),
    ],
  );
}