import 'package:flutter/material.dart';
import 'cardView.dart';
import 'package:http/http.dart';
import 'topRecipyHttpService.dart';
import 'topRecipies.dart';

class CardList extends StatelessWidget {
  final HttpService httpService = HttpService();
  int x;
  CardList(this.x);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: httpService.getRecipies(),
        builder: (BuildContext context, AsyncSnapshot<List<TopRecipy>> snapshot) {
          if (snapshot.hasData&&x==1) {
            List<TopRecipy> posts = snapshot.data;
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return cardView(context, index,posts);
                });
          } else {x=1;
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
