// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  Icon iconss;
  ButtonWidget({Key? key, required this.iconss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xff3B3B3B),
      ),
      child: Center(
        child: Icon(Icons.add),
      ),
    );
  }
}
