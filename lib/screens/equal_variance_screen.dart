import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:dipnotes/widgets/optionbutton.dart';
import 'show_statmethod_screen.dart';

class EqualVarianceScreen extends StatelessWidget {
  static const String id = '/EqualVarianceScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AutoSizeText(
          '5. Gelijke variantie',
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
                                recommendedMethod:
                                    'Independent sample T-test (Student)',
                                urlLink:
                                    'https://www.socscistatistics.com/tests/studentttest/default.aspx'),
                          ),
                        ),
                    isScrollControlled: true);
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
                                recommendedMethod:
                                    'Independent sample T-test (Welch)',
                                urlLink:
                                    'http://www.statskingdom.com/150MeanT2uneq.html'),
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
