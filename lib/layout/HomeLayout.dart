import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/layout/cubit/cubit.dart';
import 'package:hotel_app/layout/cubit/states.dart';

class HomeLayout extends StatelessWidget {

  Widget build(BuildContext context){
    return BlocProvider(
      create:(context) =>  AppCubit()..getHotelData(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return  Scaffold(
            backgroundColor: Colors.deepPurple,
          );
        },

      ),
    );
  }

}


