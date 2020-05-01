import 'package:auto_size_text/auto_size_text.dart';
import 'package:dipnotes/screens/normal_dist_dependant_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:dipnotes/widgets/optionbutton.dart';
import 'show_statmethod_screen.dart';

class NumericalDependantScreen extends StatelessWidget {
  static const String id = '/NumericalDependantScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AutoSizeText(
          '3. Numeriek',
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
                  'Is je afhankelijke variabele een proportie?',
                  maxLines: 1,
                  style: kQuestionStyle,
                ),
                AutoSizeText(
                  'Is je afhankelijke variabele is een ratio uit te drukken, zoals bijvoorbeeld een conversie-ratio?',
                  style: TextStyle(color: kDipOrange, fontSize: 15),
                  maxLines: 2,
                ),
              ],
            ),
            OptionButton(
              buttonText: 'Ja',
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: StatMethodScreen(
                                recommendedMethod: '2 Sample Z-test',
                                urlLink:
                                    'https://www.socscistatistics.com/tests/ztest/'),
                          ),
                        ),
                    isScrollControlled: true);
              },
            ),
            OptionButton(
              buttonText: 'Nee',
              onPressed: () {
                Navigator.pushNamed(context, NormalDistDependantScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
