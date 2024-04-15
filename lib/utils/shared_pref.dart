import 'package:belajar_storage_local/model/people_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _keyToken = 'token';
String _keyUmur = 'umur';

String _keyName = 'name';
String _keyJenisKelamin = 'jenisKelamin';
String _keyEmail = "email";

class SharedPref {
  static void saveToken({required String token}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_keyToken, token);
  }

  static void saveUmur({required int umur}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setInt(_keyUmur, umur);
  }

  static Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? token = preferences.getString(_keyToken);

    return token;
  }

  static Future<int?> getUmur() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    int? umur = preferences.getInt(_keyUmur);

    return umur;
  }

  static void removeToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.remove(_keyToken);
  }

  static void removeAllKey() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  static Future<void> savePeopleModel({
    required String name,
    required String jenisKelamin,
    required String email,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_keyName, name);
    await preferences.setString(_keyJenisKelamin, jenisKelamin);
    await preferences.setString(_keyEmail, email);
  }

  static Future<PeopleModel> getPeopleModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final name = preferences.getString(_keyName);
    final jenisKelamin = preferences.getString(_keyJenisKelamin);
    final email = preferences.getString(_keyEmail);

    return PeopleModel(
      name: name,
      jenisKelamin: jenisKelamin,
      email: email,
    );
  }
}
