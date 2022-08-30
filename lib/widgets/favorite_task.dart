import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/widgets/list_task.dart';

class FavoriteTask extends StatelessWidget {
  const FavoriteTask({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    List<Task> favoriteTask = [];

    for (var i = 0; i < tasksList.length; i++) {
      if (tasksList[i].isFav == true) {
        favoriteTask.add(tasksList[i]);
      }
    }
    return Column(
      children: [
        Center(
          child: Chip(label: Text("${favoriteTask.length.toString()} Tasks")),
        ),
        ListTask(
          tasks: favoriteTask,
        )
      ],
    );
  }
}
