import 'package:flutter/material.dart';

class ThemeLogic extends ChangeNotifier {
  int _themeIndex = 0; //system mode
  int get themeIndex => _themeIndex;

  void setTheme(int index) {
    _themeIndex = index;
    notifyListeners();
  }

  void changeToSystem() {
    _themeIndex = 0;
    notifyListeners();
  }

  void changeToDark() {
    _themeIndex = 1;
    notifyListeners();
  }

  void changeToLight() {
    _themeIndex = 2;
    notifyListeners();
  }

  // bool _dark = false;
  // bool get dark => _dark;

  // void setDark(bool value){
  //   // _dark = value;
  //   notifyListeners();
  // }

  // void changeToDark(){
  //   _dark = true;
  //   notifyListeners();
  // }

  // void changeToLight(){
  //   _dark = false;
  //   notifyListeners();
  // }
}
