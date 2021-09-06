import 'package:internative_task/core/network/services.dart';
import 'package:internative_task/screens/home/model/user_model.dart' as UM;
import 'package:internative_task/screens/profile/model/profile_model.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../main.dart';
part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store {
  var services = getIt.get<Services>();

  @observable
  ProfileModel? profileData;

  @observable
  Object? profileDataError;

  @observable
  List<UM.Data> friendsList = [];

  @action
  getProfile(String userId) async {
    try {
      var result = await services.getUser(userId);
      if (result.hasError!) {
        throw result.message!;
      }
      profileData = result;
      return result;
    } catch (e) {
      profileDataError = e;
      print(e);
    }
  }

  @action
  myFriends() async {
    try {
      var result = await services.getFriendsList();
      friendsList = result.data!;
      return result;
    } catch (e) {}
  }

  @action
  formatDate(String date) {
    DateTime parseDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd.MM.yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}
