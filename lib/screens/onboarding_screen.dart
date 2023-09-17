import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:unit_converter_app/constants/color_constant.dart';
import 'package:unit_converter_app/widgets/gap.dart';
import '../modules/onboarding_contents.dart';
import 'home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  int currentIndex = 0;
  PageController? controller;
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            if (currentIndex == onboarding_contents.length - 3)
              TextButton(
                onPressed: () {
                  controller?.jumpToPage(onboarding_contents.length);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                      color: CustomColors.third,
                      fontFamily: "Poppins",
                      fontSize: 10.sp),
                ),
              )
            else if (currentIndex == onboarding_contents.length - 2)
              TextButton(
                onPressed: () {
                  controller?.jumpToPage(onboarding_contents.length);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                      color: CustomColors.third,
                      fontFamily: "Poppins",
                      fontSize: 10.sp),
                ),
              )
            else
              const SizedBox()
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: onboarding_contents.length,
                onPageChanged: (int index) {
                  setState(
                    () {
                      currentIndex = index;
                    },
                  );
                },
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      SvgPicture.asset(
                        onboarding_contents[i].images!,
                        height: 25.h,
                        width: 340.w,
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        onboarding_contents[i].title!,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: CustomColors.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        onboarding_contents[i].details!,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12.sp,
                          color: CustomColors.secondary,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Gap(
                  width: 2.w,
                ),
                if (currentIndex == onboarding_contents.length - 2)
                  TextButton(
                    onPressed: () {
                      controller?.previousPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: CustomColors.third,
                        fontFamily: "Poppins",
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                else if (currentIndex == onboarding_contents.length - 1)
                  TextButton(
                    onPressed: () {
                      controller?.previousPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: CustomColors.third,
                        fontFamily: "Poppins",
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                else
                  Gap(
                    width: 16.3.w,
                  ),
                Gap(
                  width: 20.w,
                ),
                Row(
                  children: List.generate(
                    onboarding_contents.length,
                    (index) => buildDot(index, context),
                  ),
                ),
                Gap(
                  width: 15.w,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(
                      CustomColors.primary,
                    ),
                  ),
                  onPressed: ()  async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    if (currentIndex == onboarding_contents.length - 1) {
                      prefs.setBool('seen', true);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                    controller?.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        currentIndex == onboarding_contents.length - 1
                            ? 'Get Started'
                            : 'Next',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      if (currentIndex == onboarding_contents.length - 1)
                        const SizedBox()
                      else
                        const Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.h),
      width: 1.5.w,
      height: 0.8.h,
      decoration: BoxDecoration(
        color: (index == currentIndex) ? CustomColors.primary : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
