import 'package:equatable/equatable.dart';

abstract class SliderEvent extends Equatable {
  const SliderEvent();

  @override
  List<Object> get props => [];
}

class SliderChanged extends SliderEvent {
  final double sliderValue;
  const SliderChanged({required this.sliderValue});

  @override
  List<Object> get props => [sliderValue];
}
