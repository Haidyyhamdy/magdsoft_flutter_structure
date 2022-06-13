import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

Widget defaultButton({
  Color? background ,
  required Function function,
  required String text,
  double radius = 10.0,
  double? width,
  double? height,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(

        onPressed: () {
          function();
        },
        child: Text(
          text,
          style:const TextStyle(
            fontSize: 20.0,
            color: AppColor.white,
          ),
        ),
      ),
    );