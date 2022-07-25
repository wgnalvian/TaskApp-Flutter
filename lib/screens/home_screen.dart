// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_expors.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/screens/add_task_screen.dart';
import 'package:task_app/widgets/list_task.dart';

class Home extends StatelessWidget {
  static String url = "/";
  Home({Key? key}) : super(key: key);



  

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddTaskScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(title: const Text('Taks App')),
          body: Column(
            children: [
              const Center(
                child: Chip(label: Text('Taks :')),
              ),
              ListTask(
                tasks: tasksList,
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addTask(context);
            },
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
