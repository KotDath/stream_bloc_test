import 'dart:async';

import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc {
  final StreamController<CalculatorState> _stateController =
      StreamController<CalculatorState>();
  final StreamController<CalculatorEvent> _eventController =
      StreamController<CalculatorEvent>();
  CalculatorState _state = CalculatorState(0);

  CalculatorBloc() {
    _eventController.stream.listen(
      (event) {
        _mapEvent(event);
      },
    );
  }

  Stream<CalculatorState> get state => _stateController.stream;

  void addEvent(CalculatorEvent event) {
    _eventController.add(event);
  }

  void _add(CalculatorEventAdd event) {
    _state += event.number;
    _stateController.add(_state);
  }

  void _sub(CalculatorEventSub event) {
    _state -= event.number;
    _stateController.add(_state);
  }

  void _multi(CalculatorEventMulti event) {
    _state *= event.number;
    _stateController.add(_state);
  }

  void _div(CalculatorEventDiv event) {
    _state /= event.number;
    _stateController.add(_state);
  }

  void _mapEvent(CalculatorEvent event) {
    event.map(add: _add, sub: _sub, multi: _multi, div: _div);
  }

  void close() {
    _stateController.close();
    _eventController.close();
  }
}
