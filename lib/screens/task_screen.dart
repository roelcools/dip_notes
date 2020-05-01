import 'package:dipnotes/widgets/optionbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:dipnotes/widgets/tasks_list.dart';
import 'package:dipnotes/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:dipnotes/models/task_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'menu_screen.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _fireStore = Firestore.instance;
// turned this stateless widget into stateful widget to try to get DL to work.

class TaskScreen extends StatefulWidget {
  static const String id = '/TaskScreen';

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  // needed to initialize dynamic links during initState.
  @override
  void initState() {
    super.initState();
    initDynamicLinks();
  }

  // Dynamic links code
  void initDynamicLinks() async {
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    print('Opened by a deeplink: $data');
    final Uri deepLink = data?.link;
// During startup
    if (deepLink != null) {
      final queryParams = deepLink.queryParametersAll;
      print(queryParams);
      print('startup app via: $deepLink');
      _fireStore.collection('notes').add({
        'text': queryParams,
        'how': 'startup',
        'timestamp': FieldValue.serverTimestamp(),
      });
      Navigator.pushNamed(context, deepLink.path);
    }
// During pull from background
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;

      if (deepLink != null) {
        // handle the query params that were included in the DL, geen idee hoe het zit met de utm_ die ik eraan toe heb gevoegd!
        final queryParams = deepLink.queryParametersAll;
        print(queryParams);
        print('pull from background via: $deepLink');
        _fireStore.collection('notes').add({
          'text': queryParams,
          'how': 'background',
          'timestamp': FieldValue.serverTimestamp(),
        });
        Navigator.pushNamed(context, deepLink.path);
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDipGreen,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kDipGreen,
        child: Icon(
          Icons.add,
          color: kDipOrange,
          size: 35,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen(),
                    ),
                  ),
              isScrollControlled: true);
          //show add task form
        },
      ),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 60, right: 30, bottom: 30, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, MenuScreen.id);
                },
                child: CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 45,
                    color: kDipGreen,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: AutoSizeText(
                      'Digital Power Noteblock',
                      style: kTaskStyle,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Image.asset(
                    'images/dip_logo.png',
                    scale: 3,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Consumer<TaskData>(
                builder: (context, taskData, child) {
                  return Text(
                    taskData.taskCount == 1
                        ? '${taskData.taskCount} task'
                        : '${taskData.taskCount} tasks',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: TasksList(),
          ),
        ),
      ]),
    );
  }
}
