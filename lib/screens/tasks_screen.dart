import 'package:flutter/material.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class TasksScreen extends StatelessWidget {
  Widget buildBottomSheet(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskScreen(
                //         (newTaskTitle) {
                //   //print(newTaskTitle);
                //   // setState(() {
                //   //   tasks.add(Task(name: newTaskTitle));
                //   // });
                //   Navigator.pop(context);
                // }
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(context: context, builder: buildBottomSheet);
        },
      ),
      backgroundColor: Colors.amber,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(Icons.list, color: Colors.amber, size: 30.0),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'To-Do',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  )),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
