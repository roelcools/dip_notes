import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:flutter/painting.dart';
import 'package:url_launcher/url_launcher.dart';

class StatMethodScreen extends StatelessWidget {
  static const String id = '/StatMethodScreen';
  final String recommendedMethod;
  final String urlLink;

  StatMethodScreen({@required this.recommendedMethod, @required this.urlLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Aanbevolen statistische methode:',
                style: TextStyle(
                    color: kDipGreen,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.all(10),
                color: kDipGreen,
                child: Text(
                  recommendedMethod,
                  style: TextStyle(color: kDipOrange, fontSize: 30),
                ),
                onPressed: () => launch(urlLink),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
