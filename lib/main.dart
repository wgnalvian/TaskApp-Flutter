import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_app/blocs/bloc/theme_bloc_bloc.dart';

import 'blocs/bloc_expors.dart';
import 'package:task_app/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(() => runApp(const MyApp()), storage: storage);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TasksBloc()),
          BlocProvider(create: (context) => ThemeBlocBloc())
        ],
        child: BlocBuilder<ThemeBlocBloc, ThemeBlocState>(
          builder: ((context, state) => MaterialApp(
                darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  /* dark theme settings */
                ),
                themeMode: state.switchValue ? ThemeMode.light : ThemeMode.dark,
                initialRoute: '/',
                routes: RouterApp.main,
              )),
        ));
  }
}
