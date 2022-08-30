part of 'theme_bloc_bloc.dart';

class ThemeBlocState extends Equatable {
  final bool switchValue;
  const ThemeBlocState({required this.switchValue});

  @override
  List<Object> get props => [switchValue];
}

class ThemeBlocInitial extends ThemeBlocState {
  const ThemeBlocInitial({required bool switchValue})
      : super(switchValue: switchValue);
}
