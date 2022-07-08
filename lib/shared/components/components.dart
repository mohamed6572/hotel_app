
import 'package:flutter/material.dart';

Widget defultButton({
  double width = double.infinity,
  Color Background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required String text,
  required VoidCallback function,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Background,
      ),
    );

Widget authButton({
  double width = double.infinity,
  bool isUpperCase = true,
  double font = 16.0,
  required String text,
  required String logo,
  required VoidCallback function,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Row(
          children: [
            Image(
                image: AssetImage('assets/images/$logo.png'),
                height: 20,
                width: 20),
            SizedBox(
              width: 9,
            ),
            Text(
              isUpperCase ? text.toUpperCase() : text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: font,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(

        border: Border.all(
          color: Colors.grey
        ),
        color: Colors.transparent,
      ),
    );


void navigateTo(context , widget)=> Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => widget
    ));

void navigateToAndFinish(context , widget)=> Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (route)=> false
);

Widget defultTextButtton({
  required String text,
  required void  Function()? function
}) => TextButton(onPressed: function, child: Text(text.toUpperCase()));


Widget defultFormField ({
  required TextInputType type,
  required TextEditingController controller,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  required String? Function(String? val)? validator,
  void Function(String val)? onChanged,
  VoidCallback? passwordShow,
  VoidCallback? onTap,
  void Function (String)? onSubmeted,


})=> TextFormField(
  onTap: onTap,
  onFieldSubmitted: onSubmeted,
  onChanged: onChanged,
  obscureText: isPassword,
  validator: validator,
  keyboardType: type,
  controller: controller,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix),
    border: OutlineInputBorder(),
    suffixIcon:  suffix != null ? IconButton(icon: Icon(suffix) , onPressed: passwordShow,) : null,




  ),

);


