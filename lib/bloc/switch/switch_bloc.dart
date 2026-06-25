import 'package:bloc/bloc.dart';
import 'switch_event.dart';
import 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<EnableOrDisableNotification>(_toggleSwitch);
  }

  void _toggleSwitch(EnableOrDisableNotification event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitched: !state.isSwitched));
  }
}
