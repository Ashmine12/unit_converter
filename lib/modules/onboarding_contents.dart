

import 'package:unit_converter_app/constants/assets.dart';

class OnboardingContents {
  String? title;
  String? images;
  String? details;

  OnboardingContents({this.title, this.images, this.details});
}

List<OnboardingContents> onboarding_contents = [
  OnboardingContents(
      title: 'Unit Search',
      images: Assets.onBoardingLogo1,
      details: "Lorem ipsum dolor sit amet, consectetur"
          "\nadipiscing elit. In nunc scelerisque "
          "\ninterdum integer elit nullam lectus. Mauris"
          "\ntortor mi in aliquam ac nibh eget non."),
  OnboardingContents(
      title: 'Select Unit',
      images: Assets.onBoardingLogo2,
      details: "Lorem ipsum dolor sit amet, consectetur"
          "\nadipiscing elit. In nunc scelerisque "
          "\ninterdum integer elit nullam lectus. Mauris"
          "\ntortor mi in aliquam ac nibh eget non."),
  OnboardingContents(
      title: 'Convert Unit',
      images: Assets.onBoardingLogo3,
      details: "Lorem ipsum dolor sit amet, consectetur"
          "\nadipiscing elit. In nunc scelerisque "
          "\ninterdum integer elit nullam lectus. Mauris"
          "\ntortor mi in aliquam ac nibh eget non."),
];
