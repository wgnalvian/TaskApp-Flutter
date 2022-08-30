import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/widgets/list_task.dart';

class DoneTask extends StatelessWidget {
  const DoneTask({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    List<Task> doneTask = [];

    for (var i = 0; i < tasksList.length; i++) {
      if (tasksList[i].isDone == true) {
        doneTask.add(tasksList[i]);
      }
    }

    return Column(
      children: [
        Center(
          child: Chip(label: Text("${doneTask.length.toString()} Tasks")),
        ),
        ListTask(
          tasks: doneTask,
        )
      ],
    );
  }
}
