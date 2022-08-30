import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_bloc_event.dart';
part 'theme_bloc_state.dart';

class ThemeBlocBloc extends Bloc<ThemeBlocEvent, ThemeBlocState> {
  ThemeBlocBloc() : super(ThemeBlocInitial(switchValue: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(ThemeBlocState(switchValue: true));
    });
    on<SwitchOffEvent>((event, emit) {
      emit(ThemeBlocState(switchValue: false));
    });
  }
}
