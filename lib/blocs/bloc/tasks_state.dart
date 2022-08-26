// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable



part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  List<Task> allTasks;
  List<Task> deleteTasks;

  TasksState({this.allTasks = const <Task>[],this.deleteTasks = const <Task>[]});

  @override
  List<Object> get props => [allTasks,deleteTasks];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<Task>.from((map['allTasks'] as List<int>).map<Task>((x) => Task.fromMap(x as Map<String,dynamic>),),),
    );
  }

 
}
