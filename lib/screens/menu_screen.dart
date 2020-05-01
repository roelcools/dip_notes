import 'package:auto_size_text/auto_size_text.dart';
import 'package:dipnotes/accounts/login_screen.dart';
import 'package:dipnotes/accounts/register_screen.dart';
import 'package:dipnotes/screens/statistical_decisiontree_screen.dart';
import 'package:dipnotes/screens/test_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:dipnotes/widgets/optionbutton.dart';
import 'package:dipnotes/models/firebase_logging.dart';

class MenuScreen extends StatelessWidget {
  static const String id = '/MenuScreen';
  final String loginID = 'Login_Account';
  final String registerID = 'Register_Account';
  final String statisticalTreeID = 'Statistical_Test_DecisionTree';
  final String testID = 'Test_Pagina';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Menu',
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
            OptionButton(
              buttonText: 'Register Button',
              onPressed: () {
                sendAnalyticsEvent(nameEvent: registerID, nameRoute: id);
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
            OptionButton(
              buttonText: 'Login Button',
              onPressed: () {
                sendAnalyticsEvent(nameEvent: loginID, nameRoute: id);
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AutoSizeText(
                  'Digital Power Tool overview',
                  maxLines: 1,
                  style: kQuestionStyle,
                ),
                SizedBox(
                  width: 2,
                ),
                Image.asset(
                  'images/dip_logo.png',
                  scale: 4,
                ),
              ],
            ),
            OptionButton(
              buttonText: 'Beslisboom voor statistische toetsen',
              onPressed: () {
                sendAnalyticsEvent(nameEvent: statisticalTreeID, nameRoute: id);
                Navigator.pushNamed(context, StatDecisionScreen.id);
              },
            ),
            OptionButton(
              buttonText: 'Test Pagina',
              onPressed: () {
                sendAnalyticsEvent(nameEvent: testID, nameRoute: id);
                Navigator.pushNamed(context, TestScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
