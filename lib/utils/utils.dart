import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  static void fieldFocusChange(BuildContext context, FocusNode currentFocusNode, FocusNode nextFocusNode) {
    currentFocusNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) async {
    await Flushbar(
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.easeInOut,
      icon: Icon(Icons.error, size: 28, color: Colors.white,),
      padding: EdgeInsets.all(15),
      // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      title: 'Hey Ninja',
      message: message,
      duration: Duration(seconds: 3),
    ).show(context);
  }

  static snakeBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message))
    );
  }
}
