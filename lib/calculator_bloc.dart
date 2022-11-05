import 'dart:async';

import 'calculator_event.dart';
import 'calculator_state.dart';

import 'package:stream_bloc/stream_bloc.dart';

class CalculatorBloc extends StreamBloc<CalculatorEvent, CalculatorState> {
  CalculatorState _state = CalculatorState(0);

  CalculatorBloc() : super(new CalculatorState(0));

  Stream<CalculatorState> _add(CalculatorEventAdd event) async* {
    _state += event.number;
    yield _state;
  }

  Stream<CalculatorState> _sub(CalculatorEventSub event) async* {
    _state -= event.number;
    yield _state;
  }

  Stream<CalculatorState> _multi(CalculatorEventMulti event) async* {
    _state *= event.number;
    yield _state;
  }

  Stream<CalculatorState> _div(CalculatorEventDiv event) async* {
    _state /= event.number;
    yield _state;
  }

  @override
  Stream<CalculatorState> mapEventToStates(CalculatorEvent event) =>
      event.map(add: _add, sub: _sub, multi: _multi, div: _div);
}
