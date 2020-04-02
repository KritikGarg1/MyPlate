import 'package:flutter/material.dart';

class SearchState with ChangeNotifier {
  SearchState();
  int _searchState =1;
  String _s=" ";

  void setSelect(int sel) {
    _searchState=sel;
    print(_searchState);
    notifyListeners();
  }
  void setString (String s){_s=s;
  print(_s);
  notifyListeners();}


  int get getSearchState  => _searchState;
  String get getString  => _s;
}