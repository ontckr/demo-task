import 'package:dio/dio.dart';
import 'package:internative_task/screens/home/model/user_model.dart';
import 'package:internative_task/screens/login/model/login_model.dart';
import 'package:internative_task/screens/profile/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  var dio = Dio();

  Services() {
    _getToken();
  }

  _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    dio.options.baseUrl = 'http://test11.internative.net';
    dio.options.headers["authorization"] = "bearer $token";
  }

  Future<LoginModel> login(String email, String password) async {
    try {
      var response = await dio.post('/Login/SignIn', data: {'email': email, 'password': password});
      var loginResponse = LoginModel.fromJson(response.data);
      if (loginResponse.hasError!) {
        throw loginResponse.message!;
      }
      return loginResponse;
    } catch (e) {
      throw e;
    }
  }

  Future setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    dio.options.headers["authorization"] = "bearer $token";
  }

  Future<UserModel> getAllUsers() async {
    try {
      var response = await dio.get('/User/GetUsers');
      var getUsersResponse = UserModel.fromJson(response.data);
      if (getUsersResponse.hasError!) {
        throw getUsersResponse.message!;
      }
      return getUsersResponse;
    } catch (e) {
      throw e;
    }
  }

  Future<ProfileModel> getMyAccount() async {
    try {
      var response = await dio.get('/Account/Get');
      var getAccountResponse = ProfileModel.fromJson(response.data);
      if (getAccountResponse.hasError!) {
        throw getAccountResponse.message!;
      }
      return getAccountResponse;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getFriendsList() async {
    try {
      var response = await dio.get('/Account/GetFriendList');
      var getFriendsResponse = UserModel.fromJson(response.data);
      if (getFriendsResponse.hasError!) {
        throw getFriendsResponse.message!;
      }
      return getFriendsResponse;
    } catch (e) {
      throw e;
    }
  }

  Future<ProfileModel> addFriends(String userId) async {
    try {
      var response = await dio.post('/User/AddToFriends', data: {"UserId": userId});
      var addFriendsResponse = ProfileModel.fromJson(response.data);
      if (addFriendsResponse.hasError!) {
        throw addFriendsResponse.message!;
      }
      return addFriendsResponse;
    } catch (e) {
      throw e;
    }
  }

  Future<ProfileModel> removeFriends(String userId) async {
    try {
      var response = await dio.post('/User/RemoveFromFriends', data: {"UserId": userId});
      var addFriendsResponse = ProfileModel.fromJson(response.data);
      if (addFriendsResponse.hasError!) {
        throw addFriendsResponse.message!;
      }
      return addFriendsResponse;
    } catch (e) {
      throw e;
    }
  }

  Future<ProfileModel> getUser(String userId) async {
    try {
      var response = await dio.post('/User/GetUserDetails', data: {"Id": userId});
      var getUserDetailsResponse = ProfileModel.fromJson(response.data);
      if (getUserDetailsResponse.hasError!) {
        throw getUserDetailsResponse.message!;
      }
      return getUserDetailsResponse;
    } catch (e) {
      throw e;
    }
  }
}
