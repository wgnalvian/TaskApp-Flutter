part of 'theme_bloc_bloc.dart';

abstract class ThemeBlocEvent extends Equatable {
  const ThemeBlocEvent();

  @override
  List<Object> get props => [];
}

class SwitchOnEvent extends ThemeBlocEvent {}

class SwitchOffEvent extends ThemeBlocEvent {}
