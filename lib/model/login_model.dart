class LoginModel {
  LoginModel({
    this.message,
    this.data,
  });

  final String? message;
  final Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.token,
    this.expiredIn,
    this.role,
  });

  final String? token;
  final int? expiredIn;
  final String? role;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        expiredIn: json["expired_in"],
        role: json["role"],
      );
}
