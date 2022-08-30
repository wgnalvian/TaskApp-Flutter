import 'package:flutter/material.dart';
import 'package:task_app/blocs/bloc_expors.dart';
import 'package:task_app/models/task.dart';

class ListTask extends StatelessWidget {
  List<Task> tasks;
  ListTask({Key? key, required this.tasks}) : super(key: key);
  TextDecoration get(index) {
    if (tasks[index].isDone == true) {
      return TextDecoration.lineThrough;
    } else {
      return TextDecoration.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    String? nameRoute = ModalRoute.of(context)!.settings.name;
    return ExpansionPanelList(
        expansionCallback: ((panelIndex, isExpanded) => context
            .read<TasksBloc>()
            .add(SwitchPanel(task: tasks[panelIndex]))),
        animationDuration: Duration(milliseconds: 300),
        children: tasks
            .map((e) => ExpansionPanel(
                headerBuilder: (context, isExpand) {
                  return GestureDetector(
                    onTap: () {},
                    child: BlocBuilder<TasksBloc, TasksState>(
                      builder: (context, state) => ListTile(
                        title: Container(width: 10, child: Text(e.title)),
                        trailing: Container(
                          width: 150,
                          child: Row(children: [
                            IconButton(
                                onPressed: () {
                                  context
                                      .read<TasksBloc>()
                                      .add(UpdateTask(task: e));
                                },
                                icon: e.isDone == true
                                    ? Icon(Icons.check)
                                    : Icon(Icons.check_box_outline_blank)),
                            IconButton(
                                onPressed: () {
                                  context
                                      .read<TasksBloc>()
                                      .add(SwitchFavorite(task: e));
                                },
                                icon: e.isFav == true
                                    ? Icon(Icons.favorite)
                                    : Icon(Icons.favorite_border)),
                            PopupMenuButton(itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  child: Text('Delete Task'),
                                  onTap: () {
                                    nameRoute == '/bin'
                                        ? context
                                            .read<TasksBloc>()
                                            .add(DeleteTask(task: e))
                                        : context
                                            .read<TasksBloc>()
                                            .add(MoveToBin(task: e));
                                  },
                                )
                              ];
                            })
                          ]),
                        ),
                      ),
                    ),
                  );
                },
                body: ListTile(
                  title: Text(e.title),
                ),
                isExpanded: e.isExpand ?? false))
            .toList());
  }
}
