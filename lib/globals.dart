import 'package:flutter/cupertino.dart';

class Globals {
  static String customTheme = 'light';

  static switchTheme(BuildContext context, {required bool isLight}) {
    customTheme = isLight == true ? 'light' : 'dark';
  }
  //static Map<>
}