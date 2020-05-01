import 'package:auto_size_text/auto_size_text.dart';
import 'package:dipnotes/screens/equal_variance_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:dipnotes/widgets/optionbutton.dart';
import 'show_statmethod_screen.dart';

class NormalDistDependantScreen extends StatelessWidget {
  static const String id = '/NormalDistDependantScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AutoSizeText(
          '4. Normaal verdeling',
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
                  'Is je afhankelijke variabele normaal verdeeld?',
                  maxLines: 1,
                  style: kQuestionStyle,
                ),
              ],
            ),
            OptionButton(
              buttonText: 'Ja',
              onPressed: () {
                Navigator.pushNamed(context, EqualVarianceScreen.id);
              },
            ),
            OptionButton(
              buttonText: 'Nee',
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: StatMethodScreen(
                                recommendedMethod: 'Mann Whitney U Test',
                                urlLink:
                                    'https://www.socscistatistics.com/tests/mannwhitney/'),
                          ),
                        ),
                    isScrollControlled: true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
