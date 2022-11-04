import 'package:freezed_annotation/freezed_annotation.dart';
part 'calculator_event.freezed.dart';


@freezed
abstract class CalculatorEvent with _$CalculatorEvent {
  const CalculatorEvent._();

  const factory CalculatorEvent.add(double number) = CalculatorEventAdd;
  const factory CalculatorEvent.sub(double number) = CalculatorEventSub;
  const factory CalculatorEvent.multi(double number) = CalculatorEventMulti;
  const factory CalculatorEvent.div(double number) = CalculatorEventDiv;
}
