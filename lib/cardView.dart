import 'package:flutter/material.dart';
import 'cardList.dart';
import 'topRecipies.dart';

Widget cardView(BuildContext context, int itemIndex, List<TopRecipy> posts) {
  double _width = MediaQuery.of(context).size.width;
  double _height = MediaQuery.of(context).size.height;
  Color c1 = Color.fromRGBO(255, 175, 55, 100);
  Color c2 = Color.fromRGBO(120, 155, 255, 100);
  if (itemIndex == 0)
    return SizedBox(
      width: _width / 6,
    );
  else
    return Padding(
      padding: EdgeInsets.only(
          left: 15, right: 15, top: _height /25, bottom: _height / 14),
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getImage(context, itemIndex, posts),
            Container(
                padding: EdgeInsets.only(top:10,left: 20,right: 10,bottom: 8),
                child: Text(
                  posts[itemIndex].title.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                  maxLines: 2,
                )),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: c2,
              blurRadius: 27.0,
              spreadRadius: 3.0,
              offset: Offset(
                10.0,
                10.0,
              ),
            )
          ],
        ),
        height: _height / 2.4,
        width: _width / 1.6,
      ),
    );
}

Widget getImage(BuildContext context, int itemIndex, List<TopRecipy> posts) {
  if (posts[itemIndex].imagesrc == null)
    return Container(
      width: 20,
      height: 20,
    );
  else
    return ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), topLeft: Radius.circular(25)),
        child: Image.network(posts[itemIndex].imagesrc));
}
