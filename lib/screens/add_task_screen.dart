import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:flutter/painting.dart';
import 'package:dipnotes/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _fireStore = Firestore.instance;

class AddTaskScreen extends StatelessWidget {
  static const String id = '/AddTaskScreen';

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Nieuwe taak',
                style: TextStyle(
                    color: kDipGreen,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: '...',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kDipOrange),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kDipOrange),
                  ),
                ),
                showCursor: true,
                cursorColor: kDipGreen,
                autofocus: true,
                textAlign: TextAlign.center,
                style: TextStyle(color: kDipGreen, fontSize: 20),
                onChanged: (value) {
                  newTaskTitle = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                padding: EdgeInsets.all(10),
                color: kDipGreen,
                child: Text(
                  'Toevoegen',
                  style: TextStyle(color: kDipOrange, fontSize: 30),
                ),
                onPressed: () {
                  if (newTaskTitle == null || newTaskTitle == '') {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask('lege taak');
                    Navigator.pop(context);
                  } else {
                    // dit voegt de taak toe aan de listview
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);
                    // dit zorgt ervoor dat ik data wegschrijf in mn database
                    _fireStore.collection('notes').add({
                      'text': newTaskTitle,
                      'timestamp': FieldValue.serverTimestamp(),
                    });
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
