class LoginModel {
  int? status;
  String? message;
  List<AccountModel>? account =[];
  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if(json["account"] != null){
      json['account'].forEach((element) {
        account!.add(AccountModel.fromJson(element));
      });
    }

  }
}

class AccountModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? updatedAt;
  String? createdAt;

  AccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }
}

