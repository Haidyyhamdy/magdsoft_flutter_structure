import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/models/register_model.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  void userLogin({
  required String email,
    required String password,
}){
    emit(LoginLoadingState());
    DioHelper.postData(
        url: loginURL,
        body: {
          'email' : email,
          "password" : password,
        }).then((value) {
if(value.data['status'] == 200){
  loginModel =LoginModel.fromJson(value.data);
  emit(LoginSuccessState(loginModel!));
}else{
  emit(LoginErrorState(value.data['message']));
}
    }).catchError((error){
emit(LoginErrorState(error));
    });
}

  IconData suffix = Icons.visibility;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisibility());
  }
  bool isConfirmNewPassword = true;
  IconData confirmPasswordSuffix = Icons.visibility;

  void changeConfirmNewPasswordVisibility() {
    isConfirmNewPassword = !isConfirmNewPassword;
    confirmPasswordSuffix =
    isConfirmNewPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisibility());
  }


  RegisterModel? registerModel;
  void userRegister({
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String name,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: registerURL, body: {
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'phone': phone,
      'name': name,
    }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      if (registerModel != null && registerModel!.status == 200) {
        emit(RegisterSuccessState(registerModel!));
        userLogin(
          email: email,
          password: password,
        );
      } else {
        emit(RegisterErrorState(registerModel!));
      }
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(registerModel!));
    });
  }



}
