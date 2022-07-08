import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/modules/register/cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void createUser({
    required String email,
    required String phone,
    required String name,
    required String password,
  }) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
          emit(RegisterSucssesState());
    })
        .catchError((e) {
          print(e);
          emit(RegisterErrorState());
    });
  }

  IconData suffix = Icons.visibility;
  bool isPasword = true;

  void changePasswordVisability() {
    isPasword = !isPasword;

    suffix = isPasword ? Icons.visibility : Icons.visibility_off;
    emit(changeregPasswordState());
  }
}
