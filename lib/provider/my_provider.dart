import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  String langCode = 'en';

  changeLanguage(String code) {
    langCode = code;
    notifyListeners();
  }
}