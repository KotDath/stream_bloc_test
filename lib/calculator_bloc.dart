import 'dart:async';

import 'calculator_event_add.dart';
import 'calculator_state.dart';

class CalculatorBloc {
  final StreamController<CalculatorState> _stateController =
      StreamController<CalculatorState>();
  final StreamController<CalculatorEventAdd> _eventController =
      StreamController<CalculatorEventAdd>();
  CalculatorState _state = CalculatorState(0);

  CalculatorBloc() {
    _eventController.stream.listen(
      (event) {
        _add(event);
      },
    );
  }

  Stream<CalculatorState> get state => _stateController.stream;

  void addEvent(CalculatorEventAdd event) {
    _eventController.add(event);
  }

  void _add(CalculatorEventAdd event) {
    _state += event.number;
    _stateController.add(_state);
  }

  void close() {
    _stateController.close();
    _eventController.close();
  }
}
