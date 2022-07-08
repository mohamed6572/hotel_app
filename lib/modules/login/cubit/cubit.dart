import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/modules/login/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);


  void UserLogin({required String email ,required String password}){

    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      emit(LoginSucssesState());
      print(FirebaseAuth.instance.currentUser?.email);
    }).catchError((e){

     print(e);
      emit(LoginErrorState());
    });
  }

IconData suffix = Icons.visibility;
bool isPasword = true;

void changePasswordVisability(){
  isPasword = !isPasword;

  suffix = isPasword ? Icons.visibility : Icons.visibility_off;
  emit(changePasswordState());

}

}