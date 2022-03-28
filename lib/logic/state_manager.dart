import 'package:flutter/widgets.dart';

class StateManager extends ChangeNotifier {

  int selectedindex = 0;
  int parse = 0;

  changeIndex(int index) {
    selectedindex = index;
    notifyListeners();
  }

  calc1() {
    int current = DateTime.now().hour;
    int parse = ((current / 24) * 100).floor();
    return parse;
  }

  double calc() {
    int current = DateTime.now().hour;
    double slider = ((current / 24) * 1);
    return slider;
  }
}
