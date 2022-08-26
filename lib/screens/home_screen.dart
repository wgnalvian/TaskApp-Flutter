// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_expors.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/screens/add_task_screen.dart';
import 'package:task_app/widgets/list_task.dart';

import 'drawer_screen.dart';

class Home extends StatelessWidget {
  static String url = "/";
  const Home({Key? key}) : super(key: key);

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddTaskScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    List<Task> tasksList = context
        .watch<TasksBloc>()
        .state
        .allTasks;
          List<Task> tasksDeleteList = context
        .watch<TasksBloc>()
        .state
        .deleteTasks;
       

        
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
       
           
        return Scaffold(
          drawer: DrawerScreen(
            tasksList: tasksList,
            taskDeleteList: tasksDeleteList,
          ),
          appBar: AppBar(title: const Text('Taks App')),
          body: Column(
            children: [
              Center(
                child:
                    Chip(label: Text("${tasksList.length.toString()} Tasks")),
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
