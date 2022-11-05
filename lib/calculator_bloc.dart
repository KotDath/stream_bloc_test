import 'package:stream_bloc/stream_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'calculator_repository.dart';

part 'calculator_bloc.freezed.dart';

@freezed
abstract class CalculatorEvent with _$CalculatorEvent {
  const CalculatorEvent._();

  const factory CalculatorEvent.add(double number) = CalculatorEventAdd;

  const factory CalculatorEvent.sub(double number) = CalculatorEventSub;

  const factory CalculatorEvent.multi(double number) = CalculatorEventMulti;

  const factory CalculatorEvent.div(double number) = CalculatorEventDiv;
}

@freezed
class CalculatorState with _$CalculatorState {
  const CalculatorState._();

  const factory CalculatorState.loading(double number) = CalculatorStateLoading;

  const factory CalculatorState.idle(double number) = CalculatorStateIdle;

  const factory CalculatorState.error(double number, Object error) =
      CalculatorStateError;
}

class CalculatorBloc extends StreamBloc<CalculatorEvent, CalculatorState> {
  final ICalculatorRepository _repository;

  CalculatorBloc({
    required ICalculatorRepository repository,
    double? initialNumber,
  })  : _repository = repository,
        super(CalculatorState.idle(initialNumber ?? 0));

  Stream<CalculatorState> _add(CalculatorEventAdd event) async* {


    yield CalculatorState.loading(state.number);
    
    await Future.delayed(const Duration(seconds: 1));

    try {
      await _repository.setCache(state.number + event.number);
      yield CalculatorState.idle(state.number + event.number);
    } on Object catch (e) {
      yield CalculatorState.error(state.number, e);
      rethrow;
    } finally {
      yield CalculatorState.idle(state.number);
    }
  }

  Stream<CalculatorState> _sub(CalculatorEventSub event) async* {
    yield CalculatorState.loading(state.number);

    await Future.delayed(const Duration(seconds: 1));

    try {
      await _repository.setCache(state.number - event.number);
      yield CalculatorState.idle(state.number - event.number);
    } on Object catch (e) {
      yield CalculatorState.error(state.number, e);
      rethrow;
    } finally {
      yield CalculatorState.idle(state.number);
    }
  }

  Stream<CalculatorState> _multi(CalculatorEventMulti event) async* {
    yield CalculatorState.loading(state.number);

    await Future.delayed(const Duration(seconds: 1));

    try {
      await _repository.setCache(state.number * event.number);
      yield CalculatorState.idle(state.number * event.number);
    } on Object catch (e) {
      yield CalculatorState.error(state.number, e);
      rethrow;
    } finally {
      yield CalculatorState.idle(state.number);
    }
  }

  Stream<CalculatorState> _div(CalculatorEventDiv event) async* {
    yield CalculatorState.loading(state.number);

    await Future.delayed(const Duration(seconds: 1));

    try {
      if (event.number == 0) {
        throw ArgumentError('На 0 делить нельзя');
      }
      await _repository.setCache(state.number / event.number);
      yield CalculatorState.idle(state.number / event.number);
    } on Object catch (e) {
      yield CalculatorState.error(state.number, e);
      rethrow;
    } finally {
      yield CalculatorState.idle(state.number);
    }
  }

  @override
  Stream<CalculatorState> mapEventToStates(CalculatorEvent event) => event.map(
        add: _add,
        sub: _sub,
        multi: _multi,
        div: _div,
      ).distinct();
}
