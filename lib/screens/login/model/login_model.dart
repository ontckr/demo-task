class LoginModel {
  List<dynamic>? validationErrors;
  bool? hasError;
  String? message;
  Data? data;

  LoginModel({this.validationErrors, this.hasError, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  String? token;

  Data({this.token});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Token'] = this.token;
    return data;
  }
}
