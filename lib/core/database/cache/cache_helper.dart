import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
    late SharedPreferences sharedPreferences;


     init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

   String? getDataString({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }


   Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }


   dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }


   Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }


   Future<bool> containsKey({required String key}) async {
    return  sharedPreferences.containsKey(key);
  }

   Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

   Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }

    final String _cachedCode = "cachedCode";

   String getCachedLanguage() {
    final code = sharedPreferences.getString(_cachedCode);
    if (code != null) {
      return code;
    } else {
      return 'ar';
    }
  }

   Future<void> cacheLanguage(String code) async {
    await sharedPreferences.setString(_cachedCode, code);
  }
}
