import 'package:flutter/material.dart';
import 'package:to_do_flutter/models/task.dart';
import 'package:provider/provider.dart';
import 'package:to_do_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  //final Function addTaskCallback;

  //AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          color: Colors.white,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                style: TextStyle(color: Colors.amber, fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
              TextField(
                textAlign: TextAlign.center,
                autofocus: true,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.amber, width: 5.0)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber))),
                cursorColor: Colors.grey,
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                color: Colors.amber,
                textColor: Colors.white,
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
