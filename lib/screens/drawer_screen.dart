import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc/theme_bloc_bloc.dart';
import 'package:task_app/blocs/bloc_expors.dart';
import 'package:task_app/models/task.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatelessWidget {
  final List<Task> tasksList;
  final List<Task> taskDeleteList;
  const DrawerScreen(
      {Key? key, required this.taskDeleteList, required this.tasksList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(context.read<ThemeBlocBloc>().state.switchValue);
    return SafeArea(
      child: Drawer(
        backgroundColor: context.watch<ThemeBlocBloc>().state.switchValue
            ? Colors.white
            : Colors.black,
        child: Column(
          children: [
            Container(
                width: double.infinity,
                color: Colors.cyan,
                child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Menu Bar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ))),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
              child: ListTile(
                leading: Icon(Icons.folder_copy),
                title: Text("My Task"),
                trailing: Text("${tasksList.length}"),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/bin');
              },
              leading: Icon(Icons.restore_from_trash),
              title: Text('Bin'),
              trailing: Text("${taskDeleteList.length}"),
            ),
            BlocBuilder<ThemeBlocBloc, ThemeBlocState>(
              builder: (context, state) {
                return Switch(
                    value: state.switchValue,
                    onChanged: (value) {
                      print(value);

                      state.switchValue
                          ? context.read<ThemeBlocBloc>().add(SwitchOffEvent())
                          : context.read<ThemeBlocBloc>().add(SwitchOnEvent());
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
