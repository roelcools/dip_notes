import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:dipnotes/widgets/optionbutton.dart';
import 'show_statmethod_screen.dart';

class MoreThanTwoGroupsScreen extends StatelessWidget {
  static const String id = '/MoreThanTwoGroupsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AutoSizeText(
          '2. >2 groepen',
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
              ],
            ),
            OptionButton(
              buttonText: 'Nominaal',
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: StatMethodScreen(
                                recommendedMethod: 'Chi Squared Test',
                                urlLink:
                                    'https://www.socscistatistics.com/tests/chisquare2/default2.aspx'),
                          ),
                        ),
                    isScrollControlled: true);
              },
            ),
            OptionButton(
              buttonText: 'Ordinaal of Interval',
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: StatMethodScreen(
                                recommendedMethod: 'Kruskal Wallis Test',
                                urlLink:
                                    'https://www.socscistatistics.com/tests/kruskal/default.aspx'),
                          ),
                        ),
                    isScrollControlled: true);
              },
            ),
            OptionButton(
              buttonText: 'Ratio',
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: StatMethodScreen(
                                recommendedMethod: 'ANOVA, ANcOVA, MANOVA',
                                urlLink:
                                    'https://www.socscistatistics.com/tests/anova/default2.aspx'),
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
