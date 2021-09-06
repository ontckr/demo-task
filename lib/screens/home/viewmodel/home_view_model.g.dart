// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$userListAtom = Atom(name: '_HomeViewModelBase.userList');

  @override
  List<Data> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(List<Data> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  final _$myFriendsAtom = Atom(name: '_HomeViewModelBase.myFriends');

  @override
  ObservableList<String> get myFriends {
    _$myFriendsAtom.reportRead();
    return super.myFriends;
  }

  @override
  set myFriends(ObservableList<String> value) {
    _$myFriendsAtom.reportWrite(value, super.myFriends, () {
      super.myFriends = value;
    });
  }

  final _$profileDataAtom = Atom(name: '_HomeViewModelBase.profileData');

  @override
  PM.ProfileModel? get profileData {
    _$profileDataAtom.reportRead();
    return super.profileData;
  }

  @override
  set profileData(PM.ProfileModel? value) {
    _$profileDataAtom.reportWrite(value, super.profileData, () {
      super.profileData = value;
    });
  }

  final _$getUsersAsyncAction = AsyncAction('_HomeViewModelBase.getUsers');

  @override
  Future getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }

  final _$addFriendAsyncAction = AsyncAction('_HomeViewModelBase.addFriend');

  @override
  Future addFriend(String userId) {
    return _$addFriendAsyncAction.run(() => super.addFriend(userId));
  }

  final _$removeFriendAsyncAction =
      AsyncAction('_HomeViewModelBase.removeFriend');

  @override
  Future removeFriend(String userId) {
    return _$removeFriendAsyncAction.run(() => super.removeFriend(userId));
  }

  final _$logOutAsyncAction = AsyncAction('_HomeViewModelBase.logOut');

  @override
  Future<dynamic> logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  final _$getMeAsyncAction = AsyncAction('_HomeViewModelBase.getMe');

  @override
  Future getMe() {
    return _$getMeAsyncAction.run(() => super.getMe());
  }

  @override
  String toString() {
    return '''
userList: ${userList},
myFriends: ${myFriends},
profileData: ${profileData}
    ''';
  }
}
