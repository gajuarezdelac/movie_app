import 'package:flutter/material.dart';

@immutable
class RegisterState {
  final String? messageError;
  final String? response;

  const RegisterState({this.messageError, this.response});
}

class InitialRegisterState extends RegisterState {}

class IsLoadingRegister extends RegisterState {}

class ErrorRegister extends RegisterState {
  const ErrorRegister({required String errorMessage})
      : super(messageError: errorMessage);
}

class SuccessRegister extends RegisterState {
  const SuccessRegister({required String response}) : super(response: response);
}
