import 'package:flutter/material.dart';
import 'package:gamble/core/app_export.dart';
import 'package:gamble/presentation/onboarding_screen/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();

  static Widget builder(BuildContext context) {
    return OnboardingScreen();
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  PageController pageController = PageController();

  List<OnboardingPage> onboardingPagesList = [
    OnboardingPage(
        description: "Описание первого экрана",
        imagePath: ImageConstant.imgClose,
        backgroundImage: ImageConstant.imgBackgroundOnGame),
    OnboardingPage(
        description: "Описание второго экрана",
        imagePath: ImageConstant.imgClose,
        backgroundImage: ImageConstant.imgBackgroundOnBoard),
    // Добавьте больше экранов по мере необходимости
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: onboardingPagesList.length,
      onPageChanged: (index) {
        setState(() {
          currentPage = index;
        });
      },
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => pageController.nextPage(
            duration: Duration(seconds: 1), curve: ElasticInCurve()),
        child: Scaffold(
          appBar: onboardingPagesList[index].appBar,
          body: Container(
           // decoration: AppDecoration.gradientBlackToBlack,
            child: Stack  (
              alignment: Alignment.center,
              children: [
                CustomImageView(imagePath:onboardingPagesList[index].backgroundImage, fit: BoxFit.cover,),
                Center(child: Text(onboardingPagesList[index].description)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
