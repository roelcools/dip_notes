import 'package:dipnotes/constants.dart';
import 'package:flutter/material.dart';

// code for the TaskTile itself.
class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;

  // constructor for this class: these are the 2 inputs needed when creating this class object.
  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.longPressCallback});

  // build method that creates this class using the constructor inputs as well.
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: isChecked,
          activeColor: kDipGreen,
          checkColor: kDipOrange,
          onChanged: checkboxCallback,
        ),
        onLongPress: longPressCallback);
  }
}
