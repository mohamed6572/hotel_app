import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/modules/login/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);


IconData suffix = Icons.visibility;
bool isPasword = true;

void changePasswordVisability(){
  isPasword = !isPasword;

  suffix = isPasword ? Icons.visibility : Icons.visibility_off;
  emit(changePasswordState());

}

}