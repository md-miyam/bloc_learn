import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter/counter_bloc.dart';
import '../bloc/counter/counter_event.dart';
import '../bloc/counter/counter_state.dart';
import '../bloc/slider/slider_bloc.dart';
import '../bloc/slider/slider_event.dart';
import '../bloc/slider/slider_state.dart';
import '../bloc/switch/switch_bloc.dart';
import '../bloc/switch/switch_event.dart';
import '../bloc/switch/switch_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  state.counter.toString(),
                  style: const TextStyle(fontSize: 60),
                ),
              );
            },
          ),
          // Increment decrement button
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounter());
                },
                child: const Text('Increment'),
              ),

              const SizedBox(width: 20),

              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounter());
                },
                child: const Text('Decrement'),
              ),
            ],
          ),

          //   Switch button
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.isSwitched != current.isSwitched,
            builder: (context, state) {
              return CupertinoSwitch(
                key: ValueKey<bool>(state.isSwitched),
                value: state.isSwitched,
                onChanged: (v) {
                  context.read<SwitchBloc>().add(EnableOrDisableNotification());
                },
                activeTrackColor: Colors.deepPurple,
              );
            },
          ),

          // Slider section controlled by SliderBloc
          BlocBuilder<SliderBloc, SliderState>(
            buildWhen: (previous, current) => previous.sliderValue != current.sliderValue,
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withAlpha((state.sliderValue * 255).toInt()),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Slider
                  Slider(
                    value: state.sliderValue,
                    min: 0.0,
                    max: 1.0,
                    label: state.sliderValue.toStringAsFixed(2),
                    activeColor: Colors.deepPurple,
                    inactiveColor: Colors.grey.shade300,
                    onChanged: (double value) {
                      context.read<SliderBloc>().add(SliderChanged(sliderValue: value));
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
