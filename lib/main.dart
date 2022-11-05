import 'package:stream_bloc_test/calculator_bloc.dart';
import 'package:stream_bloc_test/key_value_store.dart';

import 'calculator_repository.dart';

void main() async {
  final store = KeyValueStore();
  final repository = CalculatorRepository(
    store: store,
  );

  final initialNumber = await repository.getCache();

  CalculatorBloc bloc = CalculatorBloc(
    repository: repository,
    initialNumber: initialNumber,
  );

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
