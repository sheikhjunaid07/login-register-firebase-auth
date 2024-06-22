import 'package:flutter/material.dart';

void displayErrorMsgToUser(String msg, BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(msg),
          ));
}
