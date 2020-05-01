import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:dipnotes/widgets/optionbutton.dart';
import 'show_statmethod_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoricalDependantScreen extends StatelessWidget {
  static const String id = '/CategoricalDependantScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AutoSizeText(
          '3. Categorisch',
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
                  'Is je afhankelijke variabele nominaal of ordinaal?',
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
                            child: Column(
                              children: <Widget>[
                                StatMethodScreen(
                                  recommendedMethod: 'Chi Squared Test',
                                  urlLink:
                                      'https://www.socscistatistics.com/tests/chisquare2/default2.aspx',
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        padding: EdgeInsets.all(10),
                                        color: kDipGreen,
                                        child: Text(
                                          'Fisher\'s exact Test',
                                          style: TextStyle(
                                              color: kDipOrange, fontSize: 30),
                                        ),
                                        onPressed: () => launch(
                                            'https://www.socscistatistics.com/tests/fisher/default2.aspx'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    isScrollControlled: true);
              },
            ),
            OptionButton(
              buttonText: 'Ordinaal',
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
