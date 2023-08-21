import 'dart:convert';

import 'package:api/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  Future<User?> loadUserList(String user, String pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(user);
    if (userJson != null) {
      Map<String, dynamic> userMap = json.decode(userJson);
      User user = User.fromJson(userMap);
      if (user.pass == pass) {
        return user;
      }
    }
    return null;
  }

  Future<User?> validUser(String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(user);
    if (userJson != null) {
      Map<String, dynamic> userMap = json.decode(userJson);
      return User.fromJson(userMap);
    }
    return null;
  }

  Future<void> saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = json.encode(user.toJson());
    await prefs.setString(user.user, userJson);
  }

  Future<void> deleteUser(String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(user);
  }
}
