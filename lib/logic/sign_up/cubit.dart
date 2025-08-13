import 'package:dio/dio.dart';
import 'package:docdoc/logic/sign_up/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  final dio = Dio();

  Future signUp({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required String gender,
  }) async {
    emit(SignUpLoadingState());

    try {
      dio.post("lll", data: {
        "email": email,
        "password": password,
        "name": name,
        "phone_number": phoneNumber,
        "gender": gender,
      });
      emit(SignUpSuccessState());
    } catch (e) {
      emit(SignUpErrorState(e.toString()));
    }
  }
}
