import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:dipnotes/models/getdata_fromdatabase.dart';

class TestScreen extends StatelessWidget {
  static const String id = '/TestScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Test screen',
          style: kTaskStyle,
        ),
        backgroundColor: kDipGreen,
      ),
      body: Column(
        children: <Widget>[
          Text('test of messagestream werkt'),
          MessageStream(),
        ],
      ),
    );
  }
}
