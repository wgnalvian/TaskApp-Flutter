import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/bloc_expors.dart';
import 'package:task_app/router.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  
   HydratedBlocOverrides.runZoned(() => runApp(const MyApp()),storage: storage);}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TasksBloc(),
        child: MaterialApp(
          initialRoute: '/',
          routes: RouterApp.main,
        
        ));
  }
}
