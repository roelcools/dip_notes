import 'package:auto_size_text/auto_size_text.dart';
import 'package:dipnotes/screens/show_statmethod_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:dipnotes/widgets/optionbutton.dart';

class CorrelationalScreen extends StatelessWidget {
  static const String id = '/CorrelationalScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '2. Correlationeel',
          style: kTaskStyle,
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
                  'Voorwaarden van de variabelen',
                  maxLines: 1,
                  style: kQuestionStyle,
                ),
                AutoSizeText(
                  'Zijn de variabelen zowel minimaal interval meetniveau als normaal verdeeld?',
                  style: TextStyle(color: kDipOrange, fontSize: 15),
                  maxLines: 2,
                ),
              ],
            ),
            OptionButton(
              buttonText: 'Ja, minimaal interval en normaal verdeeld',
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: StatMethodScreen(
                                recommendedMethod: 'Pearson\'s R',
                                urlLink:
                                    'https://www.socscistatistics.com/tests/pearson/'),
                          ),
                        ),
                    isScrollControlled: true);
              },
            ),
            OptionButton(
              buttonText: 'Nee, voldoen niet aan 1 of beide voorwaarden',
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: StatMethodScreen(
                                recommendedMethod: 'Spearman\'s Rho',
                                urlLink:
                                    'https://www.socscistatistics.com/tests/spearman/default.aspx'),
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
