import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/widgets/list_task.dart';

class AllTask extends StatelessWidget {
  const AllTask({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Chip(label: Text("${tasksList.length.toString()} Tasks")),
        ),
        ListTask(
          tasks: tasksList,
        )
      ],
    );
  }
}
