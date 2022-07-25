import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';
import 'blocs/bloc_expors.dart';
import 'package:task_app/router.dart';

void main() => BlocOverrides.runZoned(() => runApp(const MyApp()) ) ;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        initialRoute: '/',
        routes: RouterApp.main,
      )
    );
    
  }
}
