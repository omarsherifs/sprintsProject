import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sprintsapp/core/network/api_client.dart';
import 'package:sprintsapp/core/network/api_urls.dart';
import 'package:sprintsapp/core/shared_prefs/shared_prefs_keys.dart';
import 'package:sprintsapp/data_source/interface/user_data_source_interface.dart';
import 'package:sprintsapp/models/user_model.dart';

class UserRemoteDataSource implements UserDataSourceInterface {
  @override
  Future<List<UserModel>> getUserData() async {
    List<UserModel> usersList = [];
    var response = await ApiClient().getRequest(ApiUrls.getUsersEndpoint);
    var data = response?.data;
    String jsonData = jsonEncode(data);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPrefsKeys.userDataKey, jsonData);
    data.forEach((element) {
      var user = UserModel.fromJson(element);
      usersList.add(user);
    });
    return usersList;
  }
}
