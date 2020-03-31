import 'package:http/http.dart' as http;
import 'dart:convert';
import 'topRecipies.dart';


class HttpService {
  final String recipyURL = "https://api.spoonacular.com/recipes/random?number=10&apiKey=89144fc6457f4a18a9f2d4e44e8883c5";

  Future<List<TopRecipy>> getRecipies() async {

    var data = await http.get(recipyURL);

    var jsonData = json.decode(data.body);

    List<TopRecipy> users = [];

    for(var u in jsonData["recipes"]){
      print(u["title"]);
      TopRecipy user = TopRecipy(u["id"],u["title"],u["title"],u["image"]);
      users.add(user);

    }

    print(users.length);

    return users;



//    Response res = await get(recipyURL);
//
//    if (res.statusCode == 200) {
//      List<dynamic> body = jsonDecode(res.body);
//
//      List<TopRecipy> recipies = body
//          .map(
//            (dynamic item) => TopRecipy.fromJson(item),
//      )
//          .toList();
//
//      return recipies;
//    } else {
//      throw "Can't get recipies.";
//    }
  }
}