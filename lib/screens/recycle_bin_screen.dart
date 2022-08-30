import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:task_app/blocs/bloc_expors.dart';
import '../widgets/list_task.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const url = "/bin";
  @override
  Widget build(BuildContext context) {
    final deleteTask = context.watch<TasksBloc>().state.deleteTasks;
    return Scaffold(
      appBar: AppBar(title: const Text('Recycle Bin')),
      body: Column(
        children: [
          Center(
            child: Chip(label: Text(" Tasks")),
          ),
          ListTask(
            tasks: deleteTask,
          )
        ],
      ),
    );
  }
}
