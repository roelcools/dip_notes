import 'package:auto_size_text/auto_size_text.dart';
import 'package:dipnotes/screens/more_than_2_groups_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:dipnotes/widgets/optionbutton.dart';
import 'package:dipnotes/screens/two_groups_screen.dart';

class NumberOfGroupsScreen extends StatelessWidget {
  static const String id = '/NumberOfGroupsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AutoSizeText(
          '1. Aantal groepen',
          style: kTaskStyle,
          maxLines: 1,
        ),
        backgroundColor: kDipGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AutoSizeText(
                  'Hoeveel groepen wil je met elkaar vergelijken?',
                  maxLines: 1,
                  style: kQuestionStyle,
                ),
                AutoSizeText(
                  'Afhankelijk van het aantal groepen dat je wil vergelijken zijn verschillende statistische toetsen geschikt',
                  style: TextStyle(color: kDipOrange, fontSize: 15),
                  maxLines: 2,
                ),
              ],
            ),
            OptionButton(
              buttonText: '2 groepen vergelijken',
              onPressed: () {
                Navigator.pushNamed(context, TwoGroupsScreen.id);
              },
            ),
            OptionButton(
              buttonText: 'Meer dan 2 groepen vergelijken',
              onPressed: () {
                Navigator.pushNamed(context, MoreThanTwoGroupsScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
