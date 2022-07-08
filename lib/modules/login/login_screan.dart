import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/modules/login/cubit/cubit.dart';
import 'package:hotel_app/modules/login/cubit/states.dart';
import 'package:hotel_app/modules/register/register_screan.dart';
import 'package:hotel_app/shared/components/components.dart';
import 'package:hotel_app/shared/constans.dart';

class Login_Screan extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/hotel.png'),
                              height: 140,
                              width: 140,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'LOGIN',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 30,

                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Login Now To See Ower hotels offer',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defultFormField(
                            type: TextInputType.emailAddress,
                            controller: emailController,
                            label: 'Email',
                            prefix: Icons.email,
                            validator: (v){
                              if(v!.isEmpty || v.trim().isEmpty){
                                return 'email must not be impty';
                              }
                              if(!IsValidEmail(v)){
                                return 'Please Enter a Vaild Email';
                              }

                            }),
                        SizedBox(
                          height: 20,
                        ),
                        defultFormField(
                            type: TextInputType.visiblePassword,
                            controller: passwordController,
                            label: 'password',
                            suffix:cubit.suffix ,
                            isPassword: cubit.isPasword,
                            passwordShow: (){
                              cubit.changePasswordVisability();
                            },
                            prefix: Icons.lock,
                            validator: (v){
                              if(v!.isEmpty || v.trim().isEmpty){
                                return 'password must not be impty';
                              }
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        defultButton(text: 'Login', function: (){}),
                        SizedBox(
                          height: 30,
                        ),
                        Text('OR',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        SizedBox(
                          height: 30,
                        ),
                        Row(

                          children: [
                            Expanded(child: authButton(text: 'google', logo: 'google_logo', function: (){})),
                            SizedBox(width: 20,),
                            Expanded(child: authButton(text: 'facBook', logo: 'fac', function: (){})),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dont\'t have an account?'),
                            defultTextButtton(
                                text: 'register now',
                                function: () {
                                  navigateTo(context, Register_Screan());
                                }),
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
