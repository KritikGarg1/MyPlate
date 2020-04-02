import 'package:http/http.dart' as http;
import 'dart:convert';
import 'topRecipies.dart';

class HttpService {
  final String recipyURL =
      "https://api.spoonacular.com/recipes/random?number=10&apiKey=03249204e9704510a430a5b79c039887";

  Future<List<TopRecipy>> getRecipies() async {
    var data = await http.get(recipyURL);

    var jsonData = json.decode(data.body);

    List<TopRecipy> users = [];

    for (var u in jsonData["recipes"]) {
      print(u["title"]);
      TopRecipy user = TopRecipy(u["id"], u["title"], u["title"], u["image"]);
      users.add(user);
    }

    print(users.length);

    return users;
  }

  Future<List<TopRecipy>> getSearchedRecipes(int x, String s) async {
    if (x == 1){
    String urlSearch = "";

      {urlSearch = "https://api.spoonacular.com/recipes/search?query=" + s + "&apiKey=03249204e9704510a430a5b79c039887";print(urlSearch);}
    var data = await http.get(urlSearch);
    var jsonData = json.decode(data.body);

    List<TopRecipy> users = [];
    for (var u in jsonData["results"]) {
      print(u["title"]);
      TopRecipy user = TopRecipy(u["id"], u["title"], u["title"], "https://spoonacular.com/recipeImages/"+u["image"]);
      users.add(user);
    }
    print("Search completed");
    return users;}
    else if(x == 2)
      {
        String urlSearch = "";

        {urlSearch = "https://api.spoonacular.com/recipes/findByIngredients?ingredients=" + s + "&apiKey=03249204e9704510a430a5b79c039887";print(urlSearch);}
        var data = await http.get(urlSearch);
        var jsonData = json.decode(data.body);

        List<TopRecipy> users = [];
        for (var u in jsonData) {
          print(u["title"]);
          TopRecipy user = TopRecipy(u["id"], u["title"], u["title"],u["image"]);
          users.add(user);
        }
        print("Search completed");
        return users;
      }
  }
}
