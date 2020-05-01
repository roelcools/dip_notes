import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dipnotes/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dipnotes/models/task_data.dart';

final _fireStore = Firestore.instance;

// goal is to just get the data out of the database that I have stored there.
// this code below has been an example of the chat app I made during the course.

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore.collection('notes').orderBy('timestamp').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          Center(
            child: CircularProgressIndicator(
              backgroundColor: kDipOrange,
            ),
          );
        }
        final messages = snapshot.data.documents.reversed;
        List<Widget> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.data['text'];
          final messageBubble = Text('$messageText');
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
