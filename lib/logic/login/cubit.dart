import 'package:dio/dio.dart';
import 'package:docdoc/logic/login/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api/url.dart';

class LoginCubit extends Cubit <LoginsStates>{

  LoginCubit() : super(LoginsInitialState());

  final dio = Dio();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginsLoadingState());

    try {

      await dio.post(
        Url.loginUrl,
        data: {
          "email": email,
          "password": password,
        },
      );



      emit(LoginsSuccessState());
    } catch (e) {
      emit(LoginsErrorState(e.toString()));
    }
  }
}