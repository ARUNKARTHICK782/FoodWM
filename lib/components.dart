import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodwm/styles.dart';


toast(message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 2,
      backgroundColor: primary(),
      textColor: Colors.white,
      fontSize: 16.0
  );

  return 1;
}

TextStyle default_teststyle() {
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: primary(),
  );
}
TextStyle dynamic_teststyle() {
  return TextStyle(
    fontSize: 20,
    color: primary(),
  );
}
