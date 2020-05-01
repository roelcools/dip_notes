import 'package:dipnotes/accounts/login_screen.dart';
import 'package:dipnotes/screens/add_task_screen.dart';
import 'package:dipnotes/screens/categorical_dependant_screen.dart';
import 'package:dipnotes/screens/equal_variance_screen.dart';
import 'package:dipnotes/screens/more_than_2_groups_screen.dart';
import 'package:dipnotes/screens/number_of_groups_screen.dart';
import 'package:dipnotes/screens/show_statmethod_screen.dart';
import 'package:dipnotes/screens/test_screen.dart';
import 'package:dipnotes/screens/two_groups_screen.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:dipnotes/models/task_data.dart';
import 'package:dipnotes/screens/statistical_decisiontree_screen.dart';
import 'package:dipnotes/screens/causorcorr_screen.dart';
import 'package:dipnotes/screens/causal_screen.dart';
import 'package:dipnotes/screens/correlational_screen.dart';
import 'package:dipnotes/screens/menu_screen.dart';
import 'package:dipnotes/screens/numerical_dependant_screen.dart';
import 'package:dipnotes/screens/normal_dist_dependant_screen.dart';
import 'package:dipnotes/accounts/register_screen.dart';
import 'package:dipnotes/accounts/chat_screen.dart';

void main() => runApp(DipNotes());

class DipNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        initialRoute: TaskScreen.id,
        routes: {
          TaskScreen.id: (context) => TaskScreen(),
          AddTaskScreen.id: (context) => AddTaskScreen(),
          MenuScreen.id: (context) => MenuScreen(),
          CausalOrCorrScreen.id: (context) => CausalOrCorrScreen(),
          CausalScreen.id: (context) => CausalScreen(),
          CorrelationalScreen.id: (context) => CorrelationalScreen(),
          StatMethodScreen.id: (context) => StatMethodScreen(),
          StatDecisionScreen.id: (context) => StatDecisionScreen(),
          NumberOfGroupsScreen.id: (context) => NumberOfGroupsScreen(),
          MoreThanTwoGroupsScreen.id: (context) => MoreThanTwoGroupsScreen(),
          TwoGroupsScreen.id: (context) => TwoGroupsScreen(),
          CategoricalDependantScreen.id: (context) =>
              CategoricalDependantScreen(),
          NumericalDependantScreen.id: (context) => NumericalDependantScreen(),
          NormalDistDependantScreen.id: (context) =>
              NormalDistDependantScreen(),
          EqualVarianceScreen.id: (context) => EqualVarianceScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          ChatScreen.id: (context) => ChatScreen(),
          TestScreen.id: (context) => TestScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
