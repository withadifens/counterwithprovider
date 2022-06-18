import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int value = 0;
  bool isDark = false;
  void incrementNumber() {
    value++;
    notifyListeners();
  }

  void decrementNumber() {
    value--;
    notifyListeners();
  }

  void clearValue() {
    value = 0;
    notifyListeners();
  }

  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
