part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;
  const AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [];
}

class DeleteTask extends TasksEvent {
  final Task task;
  const DeleteTask({
    required this.task,
  });

  @override
  List<Object> get props => [];
}

class UpdateTask extends TasksEvent {
  final Task task;
  const UpdateTask({
    required this.task,
  });

  @override
  List<Object> get props => [];
}

class MoveToBin extends TasksEvent {
  final Task task;
  const MoveToBin({required this.task});
  @override
  List<Object> get props => [];
}

class SwitchPanel extends TasksEvent {
  final Task task;
  const SwitchPanel({required this.task});
  @override
  List<Object> get props => [];
}

class SwitchFavorite extends TasksEvent {
  final Task task;
  const SwitchFavorite({required this.task});
  @override
  List<Object> get props => [];
}
