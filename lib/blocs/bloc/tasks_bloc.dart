import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:task_app/models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<MoveToBin>(_onMoveToBin);
    on<SwitchPanel>(_onSwitchPanel);
    on<DeleteTask>(_onDeleteTask);
    on<SwitchFavorite>(_onSwitchFavorite);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(allTasks: List.from(state.allTasks)..add(event.task)));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    Task task = event.task;
    int index = state.allTasks.indexWhere((element) => task.id == element.id);
    List<Task> alltask = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? alltask.insert(index, task.copyWith(isDone: true))
        : alltask.insert(index, task.copyWith(isDone: false));

    emit(TasksState(allTasks: alltask));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(allTasks: List.from(state.allTasks)..remove(event.task)));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  void _onMoveToBin(MoveToBin event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        allTasks: List.from(state.allTasks)..remove(event.task),
        deleteTasks: List.from(state.deleteTasks)..add(event.task)));
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }

  void _onSwitchPanel(SwitchPanel event, Emitter<TasksState> emit) {
    final state = this.state;
    Task task = event.task;
    int index = state.allTasks.indexOf(task);
    List<Task> alltask = List.from(state.allTasks)..remove(task);
    print(task.isExpand == false);
    task.isExpand == false
        ? alltask.insert(index, task.copyWith(isExpand: true))
        : alltask.insert(index, task.copyWith(isExpand: false));
    emit(TasksState(allTasks: alltask));
  }

  void _onSwitchFavorite(event, emit) {
    final state = this.state;
    Task task = event.task;
    int index = state.allTasks.indexWhere((element) => task.id == element.id);
    List<Task> alltask = List.from(state.allTasks)..remove(task);
    task.isFav == false
        ? alltask.insert(index, task.copyWith(isFav: true))
        : alltask.insert(index, task.copyWith(isFav: false));

    emit(TasksState(allTasks: alltask));
  }
}
