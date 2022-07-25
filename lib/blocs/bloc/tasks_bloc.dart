import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/blocs/bloc_expors.dart';
import 'package:task_app/models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(allTasks: List.from(state.allTasks)..add(event.task)));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    Task task = event.task;
    int index = state.allTasks.indexOf(task);
    List<Task> alltask = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? alltask.insert(index,task.copyWith(isDone: true))
        : alltask.insert(index,task.copyWith(isDone: false));
      
      emit(TasksState(allTasks : alltask));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(allTasks: List.from(state.allTasks)..remove(event.task)));
  }
}
