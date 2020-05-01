import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';

class OptionButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  OptionButton({this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 40, right: 40),
        highlightColor: kDipOrange,
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: onPressed,
        color: kDipGreen,
        child: Text(buttonText, style: TextStyle(color: kDipOrange)),
      ),
    );
  }
}
