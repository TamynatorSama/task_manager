import 'package:flutter/material.dart';

class StateManager extends ChangeNotifier {
  bool darkModeValue = true;
  toggleSwitch() {
    darkModeValue = !darkModeValue;
    notifyListeners();
  }

  int selectedindex = 0;
  bool owk = false;

  DateTime current = DateTime.now();
  DateTime begin = DateTime.now();
  DateTime end = DateTime.now();

  TimeOfDay start = const TimeOfDay(hour: 12, minute: 12);
  TimeOfDay endTime = const TimeOfDay(hour: 23, minute: 59);

  String selectedColor = "ffffff";

  Future startTime(context) async {
    var initialTime = TimeOfDay(hour: current.hour, minute: current.minute);

    var newTime =
        await showTimePicker(context: context, initialTime: initialTime);
    if (newTime == null) return;
    start = newTime;
    notifyListeners();
  }

  changeIndex(int index) {
    if (index == 2) {
      selectedindex = selectedindex;
    } else {
      selectedindex = index;
    }
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

// Begin date picker function
  Future beginDatePicker(BuildContext context) async {
    DateTime current = DateTime.now();

    var newDAte = await showDatePicker(
        context: context,
        initialDate: current,
        firstDate: DateTime(current.year - 10),
        lastDate: DateTime(current.year + 10));
    if (newDAte == null) return null;
    begin = newDAte;
    var initialTime = TimeOfDay(hour: current.hour, minute: current.minute);

    var newTime =
        await showTimePicker(context: context, initialTime: initialTime);
    if (newTime == null) return;
    start = newTime;
    notifyListeners();
  }

  // End date picker function
  Future endDatePicker(BuildContext context) async {
    DateTime current = DateTime.now();

    var newDAte = await showDatePicker(
        context: context,
        initialDate: current,
        firstDate: DateTime(current.year - 10),
        lastDate: DateTime(current.year + 10));
    if (newDAte == null) return null;
    end = newDAte;
    var initialTime = TimeOfDay(hour: current.hour, minute: current.minute);

    var newTime =
        await showTimePicker(context: context, initialTime: initialTime);
    if (newTime == null) return;
    endTime = newTime;
    notifyListeners();
  }

  // color changer
  selectColor(String color) {
    selectedColor = color;
    notifyListeners();
  }

  change() {
    owk = !owk;
    notifyListeners();
  }
}
