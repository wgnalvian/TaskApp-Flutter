import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_expors.dart';
import 'package:task_app/models/task.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleContoller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    titleContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              const Text('Add Task',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 10,
              ),
              TextField(
                autofocus: true,
                controller: titleContoller,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel')),
                  ElevatedButton(
                      onPressed: () {
                        context.read<TasksBloc>().add(
                            AddTask(task: Task(title: titleContoller.text)));
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add'))
                ],
              )
            ])),
      ),
    );
  }
}
