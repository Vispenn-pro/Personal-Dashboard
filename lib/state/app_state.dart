import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier{
  var username = "";
  var selectedIndex = 0;

  void login(name){
    selectedIndex = 1;
    username = name;
    notifyListeners();
  }
}