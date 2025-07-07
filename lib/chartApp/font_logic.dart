import 'package:flutter/material.dart';

class FontLogic extends ChangeNotifier {
  double _size = 17;
  double get size => _size;

  void increase() {
    if (_size < 30) _size += 3;
    notifyListeners();
  }

  void decrease() {
    if (_size < 30) _size -= 3;
    notifyListeners();
  }
}
