import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_expors.dart';
import 'package:task_app/models/task.dart';

class ListTask extends StatelessWidget {
  List<Task> tasks;
  ListTask({Key? key, required this.tasks}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (context, index) => 
      ListTile(
       onLongPress: () => context.read<TasksBloc>().add(DeleteTask(task: tasks[index])),
        title: Text(tasks[index].title),
        trailing: Checkbox(value: tasks[index].isDone, onChanged: (value) {BlocProvider.of<TasksBloc>(context).add(UpdateTask(task: tasks[index]));}),
      ),
      itemCount: tasks.length,
    ));
  }
}
