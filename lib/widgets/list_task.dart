import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_expors.dart';
import 'package:task_app/models/task.dart';

class ListTask extends StatelessWidget {
  List<Task> tasks;
  ListTask({Key? key, required this.tasks}) : super(key: key);
  TextDecoration get(index) {
    if(tasks[index].isDone == true){
      return TextDecoration.lineThrough;
    }else{
      return TextDecoration.none;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (context, index) {
        
        return ListTile(
          onLongPress: () =>
              context.read<TasksBloc>().add(DeleteTask(task: tasks[index])),
          title: Text(
            tasks[index].title,
            style: TextStyle(
                decoration: get(index)),
          ),
          trailing: Checkbox(
              value: tasks[index].isDone,
              onChanged: (value) {
                BlocProvider.of<TasksBloc>(context)
                    .add(UpdateTask(task: tasks[index]));
              }),
        );
      },
      itemCount: tasks.length,
    ));
  }
}
