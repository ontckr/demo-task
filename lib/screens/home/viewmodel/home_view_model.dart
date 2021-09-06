import 'package:internative_task/screens/home/model/user_model.dart';
import 'package:internative_task/screens/profile/model/profile_model.dart' as PM;
import 'package:mobx/mobx.dart';
import 'package:internative_task/core/network/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../main.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  var services = getIt.get<Services>();

  @observable
  List<Data> userList = [];

  @observable
  ObservableList<String> myFriends = new ObservableList();

  @observable
  PM.ProfileModel? profileData;

  @action
  getUsers() async {
    try {
      var result = await services.getAllUsers();
      userList = result.data!;
      return result;
    } catch (e) {
      print(e);
    }
  }

  @action
  addFriend(String userId) async {
    try {
      await services.addFriends(userId);
      myFriends.add(userId);
    } catch (e) {
      print(e);
    }
  }

  @action
  removeFriend(String userId) async {
    try {
      await services.removeFriends(userId);
      myFriends.remove(userId);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future logOut() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove("token");
    } catch (e) {
      print(e);
    }
  }

  @action
  getMe() async {
    try {
      var result = await services.getMyAccount();

      profileData = result;

      profileData!.data!.friendIds!.forEach((element) {
        myFriends.add(element);
      });
    } catch (e) {
      print(e);
    }
  }
}
