import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
class TimerProvider extends ChangeNotifier{
  int internalOptionCount=1;
  int pomodoroCount=1;
  int minutes = 25;
  int seconds = 00;
  int option=1;
  bool isRunning = false;
  Timer? timer;
  var durationInSecs=0;
  void startTimer() {
    if(isRunning) return;
    if (!isRunning) {
      durationInSecs=minutes*60+seconds;
      timer=Timer.periodic(const Duration(seconds: 1), (timer) {
        durationInSecs--;

        if(durationInSecs<=0)
          {
            timer.cancel();
            pomodoroCount++;
            internalOptionCount=internalOptionCount%10+1;
            isRunning=false;
            notifyListeners();
          }
        else {
          minutes = durationInSecs ~/ 60; // Update minutes based on remaining seconds
          seconds = durationInSecs % 60;
          notifyListeners();
        }
      });
      isRunning = true;
      notifyListeners();
      // Implement your timer logic here
    }
  }

  void stopTimer() {
    if (isRunning) {
      timer?.cancel();
      isRunning = false;
      notifyListeners();
      // Implement logic to stop the timer
    }
  }

  void resetTimer() {
    minutes = 25;
    seconds = 0;
    pomodoroCount++;
    internalOptionCount=internalOptionCount%10+1;
    durationInSecs=0;
    timer?.cancel();
    isRunning = false;
    updateOption();
    notifyListeners();
    // Implement logic to reset the timer
  }

  void updateOption(){
      if(internalOptionCount==10)
        option=3;
      else
      option=(internalOptionCount%2==0)?2:1;
      if(option==1)
        {
          minutes=25;
          seconds=0;
        }
      if(option==2)
      {
        minutes=5;
        seconds=0;
      }
      if(option==3)
      {
        minutes=15;
        seconds=0;
      }
      notifyListeners();
  }
}