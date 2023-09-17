import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unit_converter_app/constants/color_constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 40.w,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          backgroundColor: const MaterialStatePropertyAll(CustomColors.primary),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}