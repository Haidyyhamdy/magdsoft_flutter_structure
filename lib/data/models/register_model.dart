class RegisterModel {
  String? message;
  int? status;
  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    status = json["status"];
  }
}