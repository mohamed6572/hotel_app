import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/layout/HomeLayout.dart';
import 'package:hotel_app/modules/login/login_screan.dart';
import 'package:hotel_app/shared/Bloc_Observer.dart';
import 'package:hotel_app/shared/network/remote/dio_helper.dart';

void main() {
  BlocOverrides.runZoned(
        () async {
      WidgetsFlutterBinding.ensureInitialized();
      Dio_Helper.init();
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,

      home: Login_Screan(),
    );
  }
}
