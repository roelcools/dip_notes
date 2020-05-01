import 'package:auto_size_text/auto_size_text.dart';
import 'package:dipnotes/screens/causal_screen.dart';
import 'package:dipnotes/screens/correlational_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:dipnotes/widgets/optionbutton.dart';

class CausalOrCorrScreen extends StatelessWidget {
  static const String id = '/CausalOrCorrScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '1. Verbanden',
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
                  'Correlationeel of causaal verband?',
                  maxLines: 1,
                  style: kQuestionStyle,
                ),
                AutoSizeText(
                  'Is er een causaal verband tussen de variabelen of is het verband correlationeel?',
                  style: TextStyle(color: kDipOrange, fontSize: 15),
                  maxLines: 2,
                ),
              ],
            ),
            OptionButton(
              buttonText: 'Correlationeel',
              onPressed: () {
                Navigator.pushNamed(context, CorrelationalScreen.id);
              },
            ),
            OptionButton(
              buttonText: 'Causaal',
              onPressed: () {
                Navigator.pushNamed(context, CausalScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
