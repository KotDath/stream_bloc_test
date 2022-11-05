import 'package:stream_bloc_test/calculator_bloc.dart';

void main() {
  CalculatorBloc bloc = CalculatorBloc();
  bloc.stream.listen(
    (event) => print(event.toString()),
    onDone: () => bloc.close(),
  );

  bloc.add(const CalculatorEventAdd(5));
  bloc.add(const CalculatorEventAdd(5));
  bloc.add(const CalculatorEventAdd(5));

  bloc.add(const CalculatorEventSub(5));
  bloc.add(const CalculatorEventSub(5));
  bloc.add(const CalculatorEventSub(5));

  bloc.add(const CalculatorEventAdd(5));
  bloc.add(const CalculatorEventMulti(5));
  bloc.add(const CalculatorEventDiv(5));
}
