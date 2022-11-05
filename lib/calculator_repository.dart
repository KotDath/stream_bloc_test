import 'key_value_store.dart';

abstract class ICalculatorRepository {
  Future<double?> getCache();

  Future<void> setCache(double value);
}

class CalculatorRepository implements ICalculatorRepository {
  final IKeyValueStore _store;

  CalculatorRepository({
    required IKeyValueStore store,
  }): _store = store;

  @override
  Future<double?> getCache() => _store.getDouble('cache');

  @override
  Future<void> setCache(double cache) => _store.setDouble('cache', cache);
}