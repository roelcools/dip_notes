import 'package:auto_size_text/auto_size_text.dart';
import 'package:dipnotes/screens/categorical_dependant_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:dipnotes/widgets/optionbutton.dart';
import 'numerical_dependant_screen.dart';

class TwoGroupsScreen extends StatelessWidget {
  static const String id = '/TwoGroupsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AutoSizeText(
          '2. Vergelijk 2 groepen',
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
                  'Wat is het meetniveau van je afhankelijke variabele?',
                  maxLines: 1,
                  style: kQuestionStyle,
                ),
                AutoSizeText(
                  'Is je afhankelijke variabele categorisch of numeriek?',
                  style: TextStyle(color: kDipOrange, fontSize: 15),
                  maxLines: 2,
                ),
              ],
            ),
            OptionButton(
              buttonText: 'Categorisch',
              onPressed: () {
                Navigator.pushNamed(context, CategoricalDependantScreen.id);
              },
            ),
            OptionButton(
              buttonText: 'Numeriek',
              onPressed: () {
                Navigator.pushNamed(context, NumericalDependantScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
