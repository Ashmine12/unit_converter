import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class Gap extends StatelessWidget {
  Gap({
    Key? key,
    this.child,
    this.height,
    this.width,
  }) : super(key: key);
  final double? height;
  final double? width;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 15.sp,
      width: width ?? 15.sp,
      child: child ,
    );
  }
}
