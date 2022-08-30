// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_expors.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/screens/add_task_screen.dart';
import 'package:task_app/widgets/all_task.dart';
import 'package:task_app/widgets/done_task.dart';
import 'package:task_app/widgets/favorite_task.dart';
import 'package:task_app/widgets/list_task.dart';

import 'drawer_screen.dart';

class Home extends StatefulWidget {
  static String url = "/";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddTaskScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    List<Task> tasksList = context.watch<TasksBloc>().state.allTasks;
    List<Task> tasksDeleteList = context.watch<TasksBloc>().state.deleteTasks;
    List<Widget> _pages = [
      AllTask(tasksList: tasksList),
      FavoriteTask(tasksList: tasksList),
      DoneTask(tasksList: tasksList)
    ];

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          drawer: DrawerScreen(
            tasksList: tasksList,
            taskDeleteList: tasksDeleteList,
          ),
          appBar: AppBar(title: const Text('Taks App')),
          body: _pages[index],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addTask(context);
            },
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  index = value;
                });
              },
              currentIndex: index,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorite'),
                BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Done')
              ]),
        );
      },
    );
  }
}
