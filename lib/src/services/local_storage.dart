abstract class LocalStorage {
  Future<String?> getString(String key);

  Future<void> setString(String key, {required String value});

  Future<void> clean(String key);
}
