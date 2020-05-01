import 'package:auto_size_text/auto_size_text.dart';
import 'package:dipnotes/screens/number_of_groups_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:dipnotes/widgets/optionbutton.dart';
import 'package:dipnotes/screens/causorcorr_screen.dart';

class StatDecisionScreen extends StatelessWidget {
  static const String id = '/StatisticalDecisionTreeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AutoSizeText(
          'Statistische beslisboom',
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
            AutoSizeText(
              'Adhv deze beslisboom kun je achterhalen wat voor jou situatie de meest geschikte statstisch toets is. Doorloop de vragen om bij de juiste toets uit te komen!',
              style: kQuestionStyle,
              maxLines: 3,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AutoSizeText(
                  'Wat is het meetniveau van je onafhankelijke variabele?',
                  maxLines: 1,
                  style: kQuestionStyle,
                ),
                AutoSizeText(
                  'Zijn alle onafhankelijke variabelen categorisch of zijn er 1 of meerdere onafhankelijke variabelen numeriek',
                  style: TextStyle(color: kDipOrange, fontSize: 15),
                  maxLines: 2,
                ),
              ],
            ),
            OptionButton(
              buttonText: 'Groepen vergelijken',
              onPressed: () {
                Navigator.pushNamed(context, NumberOfGroupsScreen.id);
              },
            ),
            OptionButton(
              buttonText: 'Verbanden tussen variabelen',
              onPressed: () {
                Navigator.pushNamed(context, CausalOrCorrScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
