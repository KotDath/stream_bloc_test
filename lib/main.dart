import 'package:stream_bloc_test/calculator_bloc.dart';
import 'package:stream_bloc_test/calculator_event.dart';

void main() {
  CalculatorBloc bloc = CalculatorBloc();
  bloc.state.listen(
    (event) => print(event.number),
    onDone: () => bloc.close(),
  );

  bloc.addEvent(const CalculatorEventAdd(5));
  bloc.addEvent(const CalculatorEventAdd(5));
  bloc.addEvent(const CalculatorEventAdd(5));

  bloc.addEvent(const CalculatorEventSub(5));
  bloc.addEvent(const CalculatorEventSub(5));
  bloc.addEvent(const CalculatorEventSub(5));

  bloc.addEvent(const CalculatorEventAdd(5));
  bloc.addEvent(const CalculatorEventMulti(5));
  bloc.addEvent(const CalculatorEventDiv(5));
}
