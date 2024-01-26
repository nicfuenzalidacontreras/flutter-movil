import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSumit() {}

  void usernameChange(String value) {
    emit(state.copyWith(
      username: value,
    ));
  }

  void emailChange(String value) {
    emit(state.copyWith(
      email: value,
    ));
  }

  void passwordChange(String value) {
    emit(state.copyWith(
      password: value,
    ));
  }
}
