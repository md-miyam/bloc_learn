import 'package:bloc/bloc.dart';
import 'slider_event.dart';
import 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(const SliderState()) {
    on<SliderChanged>(_onSliderChanged);
  }

  void _onSliderChanged(SliderChanged event, Emitter<SliderState> emit) {
    emit(state.copyWith(sliderValue: event.sliderValue));
  }
}
