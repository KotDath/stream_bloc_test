import 'dart:io';
import 'dart:convert';

abstract class IKeyValueStore {
  Future<int?> getInt(String key);

  Future<void> setInt(String key, int value);

  Future<double?> getDouble(String key);

  Future<void> setDouble(String key, double value);

  Future<bool?> getBool(String key);

  Future<void> setBool(String key, bool value);

  Future<String?> getString(String key);

  Future<void> setString(String key, String value);
}

class KeyValueStore implements IKeyValueStore {
  final _file = File(r'assets\db.json');
  late final _cache = () async {
    if (await _file.exists()) {
      return jsonDecode(await _file.readAsString()) as Map<String, dynamic>;
    }

    return <String, dynamic>{};
  }();

  Future<T?> _getObject<T>(String key) => _cache.then((value) => value[key] as T?);

  Future<void> _setObject(String key, Object value) async {
    final _cache = await this._cache;
    _cache[key] = value;
    await _file.writeAsString(jsonEncode(_cache));
  }

  @override
  Future<int?> getInt(String key) => _getObject<int>(key);

  @override
  Future<void> setInt(String key, int value) => _setObject(key, value);

  @override
  Future<double?> getDouble(String key) => _getObject<double>(key);

  @override
  Future<void> setDouble(String key, double value) => _setObject(key, value);

  @override
  Future<bool?> getBool(String key) => _getObject<bool>(key);

  @override
  Future<void> setBool(String key, bool value) => _setObject(key, value);

  @override
  Future<String?> getString(String key) => _getObject<String>(key);

  @override
  Future<void> setString(String key, String value) => _setObject(key, value);
}
