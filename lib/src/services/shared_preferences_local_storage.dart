import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage.dart';

class SharedPreferencesLocalStorage implements LocalStorage {
  const SharedPreferencesLocalStorage();

  @override
  Future<String?> getString(String key) async {
    final instance = await SharedPreferences.getInstance();
    return instance.getString(key);
  }

  @override
  Future<void> setString(String key, {required String value}) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(key, value);
  }

  @override
  Future<void> clean(String key) async {
    final instance = await SharedPreferences.getInstance();
    await instance.remove(key);
  }
}
