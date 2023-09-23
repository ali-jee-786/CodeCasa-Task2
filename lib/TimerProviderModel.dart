import 'dart:async';
import 'package:flutter/material.dart';

class TimerProviderModel extends ChangeNotifier {
  int sec = 0;
  int min = 0;
  int hour = 0;

  int savedSec = 0;
  int savedMin = 0;
  int savedHour = 0;
  bool saved = false;

  bool alreadyStart = false;
  Timer? timer;
  Color holdColor = Colors.blue;
  Color stopColor = Colors.blue;
  Color startColor = Colors.blue;

  void start() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      sec++;
      if (sec == 60) {
        min++;
        sec = 0;
        if (min == 60) {
          hour++;
          min = 0;
        }
      }
      notifyListeners();
    });

    notifyListeners();
  }
  void saveTime(){
    savedSec = sec;
    savedMin = min;
    savedHour = hour;
    saved = true;
    notifyListeners();

  }
  void removeSaveTime(){
    saved = false;
    savedSec = 0;
    notifyListeners();
  }
  void stop() {
    timer!.cancel(); // Cancel the timer to stop it.
    alreadyStart = false;
    notifyListeners();
  }
  void hold() {
    timer!.cancel();
    alreadyStart = false;
    notifyListeners();
  }
  void reset() {
    hour = 0;
    min = 0;
    sec = 0;
    stop();
    alreadyStart = false;
    startColor = Colors.blue;
    stopColor = Colors.blue;
    holdColor = Colors.blue;
    notifyListeners();
  }
}
