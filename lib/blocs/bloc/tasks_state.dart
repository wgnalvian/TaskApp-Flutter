// ignore_for_file: must_be_immutable

part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  List<Task> allTasks ;
  
  TasksState({this.allTasks = const <Task>[] });
  
  @override
  List<Object> get props => [allTasks];
}

 
