import 'package:stream_bloc_test/calculator_bloc.dart';
import 'package:stream_bloc_test/calculator_event_add.dart';

void main() {
  CalculatorBloc bloc = CalculatorBloc();
  bloc.state.listen(
    (event) => print(event.number),
    onDone: () => bloc.close(),
  );

  bloc.addEvent(CalculatorEventAdd(5));
  bloc.addEvent(CalculatorEventAdd(5));
  bloc.addEvent(CalculatorEventAdd(5));
}
