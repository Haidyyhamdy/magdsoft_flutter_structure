part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}


class LoginLoadingState extends GlobalState {}

class LoginSuccessState extends GlobalState {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends GlobalState {
  final String error;

  LoginErrorState(this.error);
}

class ChangePasswordVisibility extends GlobalState {}


class RegisterLoadingState extends GlobalState {}

class RegisterSuccessState extends GlobalState {
  final RegisterModel registerModel;

  RegisterSuccessState(this.registerModel);
}


class RegisterErrorState extends GlobalState {
  final RegisterModel registerModel;

  RegisterErrorState(this.registerModel);
}

