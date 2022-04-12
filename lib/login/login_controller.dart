// ignore_for_file: prefer_final_fields, unused_field

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var _googlesignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  login() async {
    googleAccount.value = await _googlesignin.signIn();
    LocalData.saveLoginInfo(true);
    LocalData.saveName(googleAccount.value?.displayName.toString() ?? "Hello");
    LocalData.saveEmail(
        googleAccount.value?.email.toString() ?? "teamWall@walllit.com");
    LocalData.saveImage(googleAccount.value?.photoUrl.toString() ?? "");
  }

  logout() async {
    googleAccount.value = await _googlesignin.signOut();
    LocalData.saveLoginInfo(false);
  }
}

class LocalData {
  static String logKey = "LoginKey";
  static String userImageKey = "imageUrl";
  static String userNameKey = "name";
  static String userEmailKey = "email";

  static Future<bool> saveLoginInfo(bool isLoggedIn) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setBool(logKey, isLoggedIn);
  }

  static Future<bool?> getLoginInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(logKey);
  }

  static Future<bool> saveName(String username) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userNameKey, username);
  }

  static Future<String?> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userNameKey);
  }

  static Future<bool> saveEmail(String useremail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userEmailKey, useremail);
  }

  static Future<String?> getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(userEmailKey);
  }

  static Future<bool> saveImage(String userimage) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userImageKey, userimage);
  }

  static Future<String?> getImage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(userImageKey);
  }
}
