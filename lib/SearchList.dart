import 'package:flutter/material.dart';
import 'cardView.dart';
import 'package:http/http.dart';
import 'topRecipyHttpService.dart';
import 'topRecipies.dart';

class SearchList extends StatelessWidget {
  final HttpService httpService = HttpService();
  int x;String s;
  SearchList(this.x,this.s);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: httpService.getSearchedRecipes(x,s),
        builder: (BuildContext context, AsyncSnapshot<List<TopRecipy>> snapshot) {
          if (snapshot.hasData) {
            List<TopRecipy> posts = snapshot.data;
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return cardView(context, index,posts);
                });
          } else {
          return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
