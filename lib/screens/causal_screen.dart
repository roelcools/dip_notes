import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:dipnotes/widgets/optionbutton.dart';
import 'show_statmethod_screen.dart';

class CausalScreen extends StatelessWidget {
  static const String id = '/CausalScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '2. Causaliteit',
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
                  'Causaal',
                  maxLines: 1,
                  style: kQuestionStyle,
                ),
                AutoSizeText(
                  'Wat is meetniveau van je onafhankelijke variabele?',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kDipOrange, fontSize: 15),
                  maxLines: 2,
                ),
              ],
            ),
            OptionButton(
              buttonText: 'Categorisch',
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: StatMethodScreen(
                                recommendedMethod: 'Logistische regressie',
                                urlLink:
                                    'https://agrimetsoft.com/regressions/Logistic'),
                          ),
                        ),
                    isScrollControlled: true);
              },
            ),
            OptionButton(
              buttonText: 'Numeriek',
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: StatMethodScreen(
                                recommendedMethod: '(Liniare) regressie',
                                urlLink:
                                    'https://www.graphpad.com/quickcalcs/linear1/'),
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
