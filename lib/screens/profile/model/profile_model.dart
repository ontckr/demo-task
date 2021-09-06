class ProfileModel {
  List<dynamic>? validationErrors;
  bool? hasError;
  String? message;
  Data? data;

  ProfileModel({this.validationErrors, this.hasError, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    if (json['ValidationErrors'] != null) {
      validationErrors = [];
      json['ValidationErrors'].forEach((v) {
        validationErrors?.add(v);
      });
    }
    hasError = json['HasError'];
    message = json['Message'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.validationErrors != null) {
      data['ValidationErrors'] = this.validationErrors?.map((v) => v.toJson()).toList();
    }
    data['HasError'] = this.hasError;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? birthDate;
  String? profilePhoto;
  List<String>? friendIds;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.fullName,
      this.email,
      this.birthDate,
      this.profilePhoto,
      this.friendIds});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    fullName = json['FullName'];
    email = json['Email'];
    birthDate = json['BirthDate'];
    profilePhoto = json['ProfilePhoto'];
    friendIds = json['FriendIds'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['FullName'] = this.fullName;
    data['Email'] = this.email;
    data['BirthDate'] = this.birthDate;
    data['ProfilePhoto'] = this.profilePhoto;
    data['FriendIds'] = this.friendIds;
    return data;
  }
}
