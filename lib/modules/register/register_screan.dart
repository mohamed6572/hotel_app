import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/modules/register/cubit/cubit.dart';
import 'package:hotel_app/modules/register/cubit/states.dart';
import 'package:hotel_app/shared/components/components.dart';
import 'package:hotel_app/shared/constans.dart';

class Register_Screan extends StatelessWidget{
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
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
                          'REGISTER',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 30,

                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'REGISTER Now To See Ower hotels offer',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defultFormField(
                            type: TextInputType.emailAddress,
                            controller: nameController,
                            label: 'Name',
                            prefix: Icons.person,
                            validator: (v){
                              if(v!.isEmpty || v.trim().isEmpty){
                                return 'Name must not be impty';
                              }
                            }),
                        SizedBox(
                          height: 20,
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
                        ),  defultFormField(
                            type: TextInputType.phone,
                            controller: phoneController,
                            label: 'Phone',
                            prefix: Icons.phone,
                            validator: (v){
                              if(v!.isEmpty || v.trim().isEmpty){
                                return 'Phone must not be impty';
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
                        defultButton(text: 'Register', function: (){

                          if(formKey.currentState!.validate()){

                            cubit.createUser(
                              email: emailController.text,
                              name: nameController.text,
                              password: passwordController.text,
                              phone: phoneController.text
                            );
                          }
                        }),


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
}}
