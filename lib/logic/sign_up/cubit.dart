import 'package:dio/dio.dart';
import 'package:docdoc/logic/sign_up/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api/url.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  final dio = Dio();

  Future signUp({
    required String email,
    required String password,
    required String password_confirmation,
    required String name,
    required String phone,
    required String gender,
  }) async {
    emit(SignUpLoadingState());

    try {
     await dio.post(
         Url.registerUrl,
         data: {
        "email": email,
        "password": password,
        "password_confirmation": password_confirmation,
        "name": name,
        "phone": phone,
        "gender": gender,
      });
      emit(SignUpSuccessState());
    } catch (e) {
      emit(SignUpErrorState(e.toString()));
    }
  }
}
