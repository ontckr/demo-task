// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  final _$profileDataAtom = Atom(name: '_ProfileViewModelBase.profileData');

  @override
  ProfileModel? get profileData {
    _$profileDataAtom.reportRead();
    return super.profileData;
  }

  @override
  set profileData(ProfileModel? value) {
    _$profileDataAtom.reportWrite(value, super.profileData, () {
      super.profileData = value;
    });
  }

  final _$profileDataErrorAtom =
      Atom(name: '_ProfileViewModelBase.profileDataError');

  @override
  Object? get profileDataError {
    _$profileDataErrorAtom.reportRead();
    return super.profileDataError;
  }

  @override
  set profileDataError(Object? value) {
    _$profileDataErrorAtom.reportWrite(value, super.profileDataError, () {
      super.profileDataError = value;
    });
  }

  final _$friendsListAtom = Atom(name: '_ProfileViewModelBase.friendsList');

  @override
  List<UM.Data> get friendsList {
    _$friendsListAtom.reportRead();
    return super.friendsList;
  }

  @override
  set friendsList(List<UM.Data> value) {
    _$friendsListAtom.reportWrite(value, super.friendsList, () {
      super.friendsList = value;
    });
  }

  final _$getProfileAsyncAction =
      AsyncAction('_ProfileViewModelBase.getProfile');

  @override
  Future getProfile(String userId) {
    return _$getProfileAsyncAction.run(() => super.getProfile(userId));
  }

  final _$myFriendsAsyncAction = AsyncAction('_ProfileViewModelBase.myFriends');

  @override
  Future myFriends() {
    return _$myFriendsAsyncAction.run(() => super.myFriends());
  }

  final _$_ProfileViewModelBaseActionController =
      ActionController(name: '_ProfileViewModelBase');

  @override
  dynamic formatDate(String date) {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.formatDate');
    try {
      return super.formatDate(date);
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
profileData: ${profileData},
profileDataError: ${profileDataError},
friendsList: ${friendsList}
    ''';
  }
}
