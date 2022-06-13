import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String? value)? validate,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  void Function()? onTap,
  bool isPassword = false,
  required String hint,
  IconData? prefixIcon,
  IconData? suffixIcon,
  Function? suffixPressed,
  bool isClickable = true,

}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      enabled: isClickable,
      obscureText: isPassword,
      onChanged: onChange,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      validator: validate,
      onTap: onTap,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hint,
        labelText: hint,
        labelStyle: const TextStyle(
          color: AppColor.darkGrey,
        ),
        hintStyle: const TextStyle(color: AppColor.grey),
        suffixIcon: suffixIcon != null
            ? IconButton(
            color: AppColor.darkGrey,
            onPressed: () {
              suffixPressed!();
            },
            icon: Icon(suffixIcon))
            : null,
        filled: true,
        fillColor: AppColor.grey,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColor.black)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.black),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
